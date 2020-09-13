import { Component, OnInit } from '@angular/core';
import { AuthService } from '../auth.service';
import {Login} from './login.model'
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {


  loigForm:Login

  constructor(private auth: AuthService)
  {
    this.loigForm = new Login()
  }

  ngOnInit(): void {
  }

  onSubmit() {
    this.auth.login(this.loigForm)
      .then(resp => {
      }, error => {
          console.log(error)
    })
  }

}
