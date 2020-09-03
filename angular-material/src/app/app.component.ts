import { Component } from '@angular/core';
import {
  FormGroup,
  FormBuilder,
  Validators,
  FormControl,
} from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { DialogComponent } from './dialog/dialog.component';

interface SaveName {
  name:string 
  lastname:string
  birthday:Date
  gender:string
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent {
  title = 'angular-material';
  need = true

  displayedColumns: string[] = ['position', 'name', 'lastname', 'birthday', 'gender', 'button'];
  dataSource = new MatTableDataSource<SaveName>();

  customer:FormGroup
  position:number = -1

  constructor(private dialog: MatDialog, private formBuilder: FormBuilder)
  {
    this.customer = this.formBuilder.group({
      name:['',[Validators.required]],
      lastname:'',
      birthday:'',
      gender:'',
    })
  }

  party = {
    name:'test',
    test:'123'
  }

  test:number = 10.1245

  save(){

      if(this.customer.valid){
        let data = this.dataSource.data
        data.push(this.customer.getRawValue())
        
        this.dataSource.data = data
    
        this.customer = this.formBuilder.group({
          name:'',
          lastname:'',
          birthday:'',
          gender:'',
        })
      }
  }

  edit(item, position){
      let dialog = this.dialog.open(DialogComponent,{
        data:item,
        width:"1000px"
      })

      this.position = position
      dialog.afterClosed().subscribe((resp) =>{
          let data = this.dataSource.data
          data[position] = resp

          this.dataSource.data = data
      })
  }

  remove(index){
      let data = this.dataSource.data
      data.splice(index,1)
      this.dataSource.data = data
  }
}
