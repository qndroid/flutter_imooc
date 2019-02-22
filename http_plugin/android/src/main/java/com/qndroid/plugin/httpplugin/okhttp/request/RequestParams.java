package com.qndroid.plugin.httpplugin.okhttp.request;

import java.io.File;
import java.net.FileNameMap;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import okhttp3.MediaType;

public class RequestParams {

  public ConcurrentHashMap<String, String> urlParams = new ConcurrentHashMap<String, String>();
  public ConcurrentHashMap<String, FileWrapper> fileParamsMap = new ConcurrentHashMap<>();

  /**
   * Constructs a new empty {@code RequestParams} instance.
   */
  public RequestParams() {
    this((Map<String, String>) null);
  }

  /**
   * Constructs a new RequestParams instance containing the key/value string
   * params from the specified map.
   *
   * @param source the source key/value string map to add.
   */
  public RequestParams(Map<String, String> source) {
    if (source != null) {
      for (Map.Entry<String, String> entry : source.entrySet()) {
        put(entry.getKey(), entry.getValue());
      }
    }
  }

  /**
   * Constructs a new RequestParams instance and populate it with a single
   * initial key/value string param.
   *
   * @param key the key name for the intial param.
   * @param value the value string for the initial param.
   */
  public RequestParams(final String key, final String value) {
    this(new HashMap<String, String>() {
      {
        put(key, value);
      }
    });
  }

  /**
   * Adds a key/value string pair to the request.
   *
   * @param key the key name for the new param.
   * @param value the value string for the new param.
   */
  public void put(String key, String value) {
    if (key != null && value != null) {
      urlParams.put(key, value);
    }
  }

  //    public void put(String key, Object object) throws FileNotFoundException {
  //
  //        if (key != null) {
  //            fileParamsMap.put(key, object);
  //        }
  //    }

  public boolean hasParams() {
    if (urlParams.size() > 0 || fileParamsMap.size() > 0) {

      return true;
    }
    return false;
  }

  public void put(String key, File file) {
    put(key, file, file.getName());
  }

  public void put(String key, File file, String fileName) {
    put(key, file, fileName, guessMimeType(fileName));
  }

  public void put(String key, File file, String fileName, MediaType contentType) {
    if (key != null) {
      fileParamsMap.put(key, new FileWrapper(file, fileName, contentType));
    }
  }

  private MediaType guessMimeType(String path) {
    FileNameMap fileNameMap = URLConnection.getFileNameMap();
    String contentType = fileNameMap.getContentTypeFor(path);
    if (contentType == null) {
      contentType = "application/octet-stream";
    }
    return MediaType.parse(contentType);
  }

  /**
   * 文件类型的包装类
   */
  public static class FileWrapper {
    public File file;
    public String fileName;
    public MediaType contentType;
    public long fileSize;

    public FileWrapper(File file, String fileName, MediaType contentType) {
      this.file = file;
      this.fileName = fileName;
      this.contentType = contentType;
      this.fileSize = file.length();
    }

    public String getFileName() {
      if (fileName != null) {
        return fileName;
      } else {
        return "nofilename";
      }
    }
  }
}