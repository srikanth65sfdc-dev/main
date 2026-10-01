import { track } from "lwc";
import { LightningElement } from 'lwc';
export default class Helloworlds extends LightningElement {
    @track greetings = 'World';
    handleChange(event){
        this.greetings = event.target.value;
    }
}