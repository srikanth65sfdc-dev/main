import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub';

export default class PubsubPublisher extends LightningElement {
    handleClick(){
    let message = {"message": 'Welcome To Class'}
    pubsub.fire('eventsimple',message);
    }
}