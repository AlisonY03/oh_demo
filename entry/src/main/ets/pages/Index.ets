import { HttpTask } from '../http/HttpTask';
import { IHttpRequest } from '../http/IHttpRequest';
import { IResultListener } from '../http/IResultListener';
import { JsonHttpListener } from '../http/JsonHttpListener';
import { RequestModel, ResponseModel } from '../http/JsonHttpModel';
import { JsonHttpRequest } from '../http/JsonHttpRequest';
import { Friend, friendList } from '../model/FriendModel';
import { ItemView } from '../view/ItemComponent';


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {

      List(){
        ForEach(friendList, (friend:Friend)=>{
          ListItem(){
            Column(){
              ItemView({item:friend, test:(name:string) =>{
                if (name == "跳转") {
                  console.log("xxxx")
                } else if (name == "网络请求"){
                  this.startHttp("xxx")

                }
              }});
            }
          }
        })

      }
    }
    .padding({ top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '12' })

  }


  startHttp(s:string){
    let url: string = "https://v.juhe.cn/historyWeather/citys";
    let requestParams: RequestModel = {
      province_id: '2',
      key: 'bb52107206585ab074f5e59a8c73875b'
    };

    let iHttpRequest: IHttpRequest = new JsonHttpRequest();
    let resultListener : ResultListener = new ResultListener();

    let iHttpListener: JsonHttpListener<ResponseModel> = new JsonHttpListener<ResponseModel>(resultListener)
    let httpTask: HttpTask<RequestModel> = new HttpTask(url, requestParams, iHttpRequest, iHttpListener);
    httpTask.run();
  }
}


 class ResultListener implements IResultListener<ResponseModel>{
  onSuccess(t:ResponseModel){
  };

  onFailure(t:ResponseModel){

  }
}