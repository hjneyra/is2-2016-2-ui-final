library logistic_ui.request;

import 'dart:async';
import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:dartson/dartson.dart';
import 'package:dartson/transformers/date_time.dart';
import 'package:logistic_ui/model.dart';

final bool DEVELOPMENT_MODE = window.location.port == "8080";

String BASE_URL = DEVELOPMENT_MODE
    ? "http://localhost:9090"
    : "http://${window.location.host}:${window.location.port}";

class BaseService {
  Dartson dson = new Dartson.JSON();

  BaseService() {
    dson.addTransformer(new DateTimeParser(), DateTime);
  }

  Future request(String resource, String method, [var data, void onProgress(ProgressEvent e)]){
    String url = "$BASE_URL/$resource";
    HttpRequest request = new HttpRequest();
    request.withCredentials=true;

    if(data==null){
      return HttpRequest.getString(url, withCredentials:false,onProgress:onProgress);
    }else{
      return HttpRequest.request(url, method: method, withCredentials: true, requestHeaders: {"Content-Type":"application/json"}, sendData: dson.encode(data));
    }
  }

  Future request2(String resource, String method,
      [Object data, void onProgress(ProgressEvent e)]) {
    String url = "$BASE_URL/$resource";
    Completer completer = new Completer();

    if (data == null) {
      HttpRequest.requestCrossOrigin(url, method: method).then((responseText) {
        completer.complete(responseText);
      });
    } else {
      HttpRequest
          .requestCrossOrigin(url, method: method, sendData: dson.encode(data))
          .then((responseText) {
        completer.complete(responseText);
      });
    }
    return completer.future;
  }

  Future get(String resourcePath) {
    return request(resourcePath, "GET");
  }

  Future post(String resourcePath, String data) {
    return request(resourcePath, "POST", data);
  }

  Future put(String resourcePath, String data) {
    return request(resourcePath, "PUT", data);
  }

  Future delete(String resourcePath) {
    return request(resourcePath, "DELETE");
  }
}

@Injectable()
class ApplicationService extends BaseService {
  Future<User> getUser(int id) {
    Completer<User> completer = new Completer<User>();

    get('rest/v1/user?id=$id').then((responseText){
      User user = dson.decode(responseText, new User(), false);
      completer.complete(user);
    });
    return completer.future;
  }
  Future<List<User>> getUsers() async {
    String responseText = await get('rest/v1/users');
    return dson.decode(responseText, new User(), true);
  }
  Future<ApplicationInfo> getApplicationInfo() {
    ApplicationInfo appInfo = new ApplicationInfo(name: "App Stub", version: "0.0.1.DEV-MODE", buildInfo:
    new ApplicationBuildInfo(revision: "000", branch: "none", buildTime: new DateTime.now()));
    return (new Completer<ApplicationInfo>()..complete(appInfo)).future;
  }
}
