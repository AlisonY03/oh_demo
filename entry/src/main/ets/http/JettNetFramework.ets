import { HttpTask } from './HttpTask';
import { IHttpListener } from './IHttpListener';
import { IHttpRequest } from './IHttpRequest';
import { IResultListener } from './IResultListener';
import { JsonHttpListener } from './JsonHttpListener';
import { JsonHttpRequest } from './JsonHttpRequest';

;


export class JettNetFramework<T> {


  static sendJsonRequest<T, M>(url: string, requestParams: T, iDataListener: IResultListener<M>) {
    let iHttpRequest: IHttpRequest = new JsonHttpRequest();
    let iHttpListener: IHttpListener = new JsonHttpListener<M>(iDataListener);
    let httpTask: HttpTask<T> = new HttpTask(url, requestParams, iHttpRequest, iHttpListener);
    httpTask.run();
  }
}
