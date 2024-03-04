/**
 * 请求的顶层接口
 */
import { IHttpListener } from './IHttpListener';

export interface IHttpRequest {

  setUrl(url:string):void;

  setParams(params:string):void;

  execute(iHttpListener:IHttpListener):Promise<void>;


}