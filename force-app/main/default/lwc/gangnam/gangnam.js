import { LightningElement} from 'lwc';
//import MUSIC_RESOURCE from '@salesforce/resourceUrl/gangnammusic';
export default class App extends LightningElement {

   /* musicres = MUSIC_RESOURCE;

    toggleMusic(event){
        this.playMusic = event.target.checked;
        this.audio = this.template.querySelector('.music');

        console.log(this.playMusic);
        if(this.playMusic){
            this.audio.play();
        }else{
            this.audio.pause();
        }
    }*/

    toggleDance(event){
        this.doDance =  event.target.checked;
        this.dance = this.template.querySelector('.character');
        this.dance_clone = this.template.querySelector('.character_clone');

        if(this.doDance){
            this.dance.classList.add('characterDance');
            this.dance_clone.classList.add('characterDance');

        }else{
            this.dance.classList.remove('characterDance');          
            this.dance_clone.classList.remove('characterDance');
        }

    }
    toggleClone(event){
        this.playClone = event.target.checked;
        this.clone = this.template.querySelector('.character_clone');
        if(this.playClone){
            this.clone.style.display = 'block';
        }else{
            this.clone.style.display = 'none';
        }
    }

}