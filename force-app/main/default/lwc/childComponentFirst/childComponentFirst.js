import { LightningElement } from 'lwc';

export default class ChildComponentFirst extends LightningElement {
    handleChange(event){
        event.preventDefault();
        const name = event.target.value;
        const eveSelected = new CustomEvent('mycustomevent',{
            detail: name
        });
        this.dispatchEvent(eveSelected);
    }
}