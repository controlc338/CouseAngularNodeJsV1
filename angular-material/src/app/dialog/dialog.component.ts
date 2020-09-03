import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { FormBuilder, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-dialog',
  templateUrl: './dialog.component.html',
  styleUrls: ['./dialog.component.scss']
})
export class DialogComponent implements OnInit {


  customer:FormGroup
  constructor(
    private DialogRef: MatDialogRef<DialogComponent>,private formBuilder: FormBuilder,
    @Inject(MAT_DIALOG_DATA) private data:any
    ) 
  {
  this.customer = this.formBuilder.group(data)
  }

  ngOnInit(): void {

  }

  save(){
      this.DialogRef.close(this.customer.getRawValue())
  }
}
