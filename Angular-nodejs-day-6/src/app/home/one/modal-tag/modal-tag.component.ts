import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { AuthService } from '../../../auth.service';

@Component({
  selector: 'app-modal-tag',
  templateUrl: './modal-tag.component.html',
  styleUrls: ['./modal-tag.component.css']
})
export class ModalTagComponent implements OnInit {
  tag: string;
  action: string;

  constructor(public dialogRef: MatDialogRef<ModalTagComponent>,
              @Inject(MAT_DIALOG_DATA) private data: any, private service: AuthService  )
{
  this.action = data.action;
}

  ngOnInit(): void {

  }

  onSave(): void{

    const tag = {
      tag: this.tag
    };

    if (this.action !== 'edit'){
        this.service.saveTag(tag)
        .then(resp => {
            if (resp.message === 'success'){
                this.dialogRef.close('success');
            }
        });
    }else{
        this.service.updateTag(tag, this.data.id)
        .then(resp => {
            if (resp.message === 'success'){
                this.dialogRef.close('success');
            }
        });
    }
  }

}
