import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { trigger, state, style, animate, transition } from '@angular/animations';
import { SwPush } from '@angular/service-worker';
import { NotficationService } from '../notfication.service'


const keys = {
  public: 'BL0AQWPUewYu69fazElPky9CC2JLSSa9bUbQvQMcafeUNhvIq9o2GtWadPQw3rrkORas5JUSgHRROuoNpSZG5Os',
  private: 'cw7ZOjZEfnU1GyL4T1OkeKdi6HJBwG1wj66X6bUdqis'
}

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  animations: [
    trigger('myTrigger', [
      state('inactive', style({
        display: 'none',
        opacity: 0,
        transform: 'translateX(-100%)'
      })),
      state('active', style({
        display: 'table',
        opacity: 1,
        transform: 'translateX(0)'
      })),
      transition('inactive => active', animate('200ms ease-in')),
      transition('active => inactive', animate('500ms ease-out'))
    ])
  ]
})
export class HomeComponent implements OnInit {

  mystateVal = 'inactive';
  @Input() messageFromparent: string;

  @Output() messageEvent = new EventEmitter<string>();
  messageService: string

  constructor(
    private swPush: SwPush,
    private notificationService: NotficationService,
  ) {

   
    //localStorage.getItem('message')

    notificationService.currentMessage.subscribe(resp => {
      this.messageService = resp
    })
  }



  sendMessge() {
    this.messageEvent.emit('Hellow')
  }

  ngOnInit(): void {
  }

  toggleTable() {
    this.mystateVal = this.mystateVal == 'active' ? 'inactive' : 'active';
  }

  sendNotification() {
    if (this.swPush.isEnabled) {
      this.swPush.requestSubscription({
        serverPublicKey: keys.public
      }).then(resp => {
        this.notificationService.sendNotification(resp)
          .subscribe(resp => {
            console.log(resp)
          }, err => console.log(err))
      })
    }
  }
}
