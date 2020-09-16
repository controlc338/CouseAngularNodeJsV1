import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { AuthService } from '../../../auth.service';

@Component({
  selector: 'app-modal-note',
  templateUrl: './modal-note.component.html',
  styleUrls: ['./modal-note.component.css']
})
export class ModalNoteComponent implements OnInit {

  note: string;
  private action: string;
  constructor(public dialogRef: MatDialogRef<ModalNoteComponent>,
              @Inject(MAT_DIALOG_DATA) private data: any, private service: AuthService)
              {
                this.action = data.action;
                this.note = data.note;
              }

    ngOnInit(): void
    {

    }
   onSave(): void{
    const body = {
      note: this.note
    };
    if (this.action !== 'edit'){
      this.service.saveNote(body)
      .then(resp => {
          if (resp.message === 'success'){
              this.dialogRef.close('success');
          }
      });
    }else{
      this.service.updateNote(body, this.data.id)
      .then(resp => {
            if (resp.message === 'success'){
                this.dialogRef.close('success');
            }
      });
    }

  }

}
