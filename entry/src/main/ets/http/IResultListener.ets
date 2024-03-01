

export interface IResultListener<T> {

  onSuccess(t: T): void;

  onFailure(t: T): void;

}
