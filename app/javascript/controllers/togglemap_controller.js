import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['toggleable', 'buttontext']

  toggle() {
    this.toggleableTarget.classList.toggle('hidden');

    if (this.toggleableTarget.classList.contains('hidden')) {
      //   this.buttontextTarget.classList.add('active');
      // } else {
      //   this.buttontextTarget.classList.remove('active');
      // }
    }
  }
}