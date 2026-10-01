import { LightningElement ,track} from 'lwc';
export default class HelloWorldEduVision extends LightningElement {
 message = "I am came from Java Script";
 @track Bankname ="ICICI";
 @track Salary ="00000";
 handleChange(event){
    this.Bankname = event.target.value;
     
 }
 handleChange1(event){
     
    this.Salary = event.target.value;
 }
 @track isShow =false;
 handleClick(event){
     
    this.isShow = true;
 }
 handleClickHide(event){
     
    this.isShow = false;
 }
 @track isWrap = true;
 handleWrap(event){
     
    this.isWrap = false;
 }
 @track ToggleText = false;
 get toggleLabelUpdate(){
     return this.ToggleText ? 'Hide Text' : 'Show Text';
 }
 handleToggleText(event){
     
    this.ToggleText = !this.ToggleText;
 }
}