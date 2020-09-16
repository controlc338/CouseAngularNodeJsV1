import { error } from '@angular/compiler/src/util';
import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/auth.service';
import { MatDialog } from '@angular/material/dialog';
import { ModalNoteComponent } from './modal-note/modal-note.component';
import { ModalTagComponent } from './modal-tag/modal-tag.component';

@Component({
  selector: 'app-one',
  templateUrl: './one.component.html',
  styleUrls: ['./one.component.css']
})
export class OneComponent implements OnInit {

  constructor(private service: AuthService, private dialog: MatDialog)
  {

  }

  noteName: string;
  notes = [];
  noteId = 0;
  keyword: string;



  ngOnInit(): void {

    this.getNote();
  }

  addNote(): void {
      const dialog = this.dialog.open(ModalNoteComponent, {
        width: '800px',
        data: {}
      });
      dialog.afterClosed().subscribe(resp => {
        if (resp === 'success'){
            this.getNote();
        }
      });

  }

  addTag(): void {
    const dialog = this.dialog.open(ModalTagComponent, {
      width: '800px',
      data: {}
    });
  }

  findByKeyword(): void {
    this.service.findBykeyworld(this.keyword)
      .then(resp => {
        this.notes = resp;
      }, error => {
          console.log(error);
      });
  }

  saveNote(): void {
    const body = {
      tag_id: 1,
      note: this.noteName
    };
    if (this.noteId != 0) {
      this.service.updateNote(body, this.noteId)
        .then(resp => {
          if (resp.message == 'success') {
              this.getNote();
          }
        });

    } else {
      this.service.saveNote(body)
        .then(resp => {
          if (resp.message == 'success') {
            this.getNote();
          }
        }, err => {
      });
    }

  }

  getNote(): void {
    this.service.getNote()
      .then(resp => {
      this.notes = resp;
      }, error => {
          console.log(error);
    });
  }

  edit(item): void {
    const data = {
        id: item.id,
        note: item.note,
        action: 'edit'
    };
    const dialog = this.dialog.open(ModalNoteComponent, {
      width: '800px',
      data
    });
    dialog.afterClosed().subscribe(resp => {
      if (resp === 'success'){
          this.getNote();
      }
    });
  }



  delete(id): void {
    this.service.deleteNote(id)
      .then(resp => {
        if (resp.message == 'success') {
          this.getNote();
        }
      }, error => {
          console.log(error);
    });
  }

}
