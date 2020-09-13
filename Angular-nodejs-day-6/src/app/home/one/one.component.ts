import { error } from '@angular/compiler/src/util';
import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/auth.service';

@Component({
  selector: 'app-one',
  templateUrl: './one.component.html',
  styleUrls: ['./one.component.css']
})
export class OneComponent implements OnInit {

  constructor(private service:AuthService) { }

  noteName:string
  notes = []
  note_id = 0
  keyword:string

  ngOnInit(): void {
    
    this.getNote()
  }

  addNote() {
    
  }

  addTag() {
    
  }

  findByKeyword() {
    this.service.findBykeyworld(this.keyword)
      .then(resp => {
        this.notes = resp
      }, error => { 
          console.log(error)
      })
  }

  saveNote() {
    let body = {
      tag_id:1,
      note:this.noteName
    }
    if (this.note_id != 0) {
      this.service.updateNote(body, this.note_id)
        .then(resp => { 
          if (resp.message == 'success') {
              this.getNote()
          }
        })
      
    } else {
      this.service.saveNote(body)
        .then(resp => {
          if (resp.message == 'success') {
            this.getNote()
          }
        }, err => {
      })
    }
    
  }

  getNote() {
    this.service.getNote()
      .then(resp => {
      this.notes = resp
      }, error => {
          console.log(error)
    })
  }

  edit(item) {
    this.noteName = item.note
    this.note_id = item.id
  }

  

  delete(id) {
    this.service.deleteNote(id)
      .then(resp => {
        if (resp.message == 'success') {
          this.getNote()
        }
      }, error => {
          console.log(error)
    })
  }

}
