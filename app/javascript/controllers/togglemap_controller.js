import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['toggleable', 'buttontext']

  toggle() {
    this.toggleableTarget.classList.toggle('hidden');

    if (this.toggleableTarget.classList.contains('hidden')) {
      this.buttontextTarget.textContent = this.data.get('open')
    } else {
      this.buttontextTarget.textContent = this.data.get('close')
    }
  }
}