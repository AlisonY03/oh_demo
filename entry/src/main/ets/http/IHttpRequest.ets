/**
 * 请求的顶层接口
 */
import { IHttpListener } from './IHttpListener';

export interface IHttpRequest {

  setUrl(url:string):void;

  setParams(params:string):void;

  execute():Promise<void>;

  //两个接口连接在一起用
  setListener(iHttpListener:IHttpListener):void;

}