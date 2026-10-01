import { LightningElement } from 'lwc';

export default class Helloclass extends LightningElement {

    firstName = "srikanth";
    lastName = "vemuri";
    handleChange(event){
        const field = event.target.name;
        if(field==='firstName'){
            this.firstName = event.target.value;
        }else if(field==='lastName'){
            this.lasttName = event.target.value;
        }
    }
}