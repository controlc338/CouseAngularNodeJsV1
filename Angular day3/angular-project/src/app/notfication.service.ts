import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { BehaviorSubject } from 'rxjs'; 

@Injectable({
  providedIn: 'root'
})
export class NotficationService {

  configURl: string = 'http://localhost:60/notification'
  
  private messageSource = new BehaviorSubject('default message');

  currentMessage = this.messageSource.asObservable();

  changeMessage(message: string) {
    this.messageSource.next(message) // คำสั่งในการส่งข้อมูล
  }


  constructor(private http: HttpClient)
  {

  }

  sendNotification(subject: PushSubscription) {
    return this.http.post(this.configURl, subject)
  }

}
