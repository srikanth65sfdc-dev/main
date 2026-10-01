import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub';

export default class PubsubSubscriber extends LightningElement {
    message;
    connectedCallback(){
        this.register();
    }
    register(){
        pubsub.register('eventsimple',this.handleEvent.bind(this));
    }
    handleEvent(msgFromEvt){
        this.message = msgFromeEvt ? JSON.stringify(msgFromEvt,null,'\t') : 'no message payload' ;
       }
}