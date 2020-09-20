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

  selectFile(event) {
    let file = event.target.files[0]
    let image = new FormData();
    image.append("image", file);
    this.service.upload(image)
    .then(resp =>{
        console.log(resp)
    }, error =>{
      console.log(error);
    })
  }

  
// upload() {
//     let file = new FormData()

//     file.append("product", this.file);
//     if(this.data.action==="edit"){
//         this._connect.upload_file({name:this.product_model.img},"/delete_img").subscribe((res)=>{
//         })
//         this._connect.upload_file(file,"/upload_img_product").subscribe((res)=>{
//             if(res.status=="success"){
//                 this.show_snackbar_accent('NAV.ERROR.UPLOAD_SUCCESS')
//                 this.form_product.patchValue({
//                     img:res.name
//                 })
//                 this.status = true;
//             }
//         })
//     }else{
//         this._connect.upload_file(file,"/upload_img_product").subscribe((res)=>{
//             if(res.status=="success"){
//                 this.show_snackbar_accent('NAV.ERROR.UPLOAD_SUCCESS')
//                 this.form_product.patchValue({
//                     img:res.name
//                 })
//                 this.status = true;
//             }
//         })
//     }
// }

}
