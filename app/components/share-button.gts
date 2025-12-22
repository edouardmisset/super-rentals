import Component from '@glimmer/component';
import { inject as service } from '@ember/service';

export interface ShareButtonSignature {
  // The arguments accepted by the component
  Args: {};
  // Any blocks yielded by the component
  Blocks: {
    default: [];
  };
  // The element to which `...attributes` is applied in the component template
  Element: null;
}

const TWEET_INTENT = 'https://twitter.com/intent/tweet';

export default class ShareButton extends Component<ShareButtonSignature> {
  @service router;

  get currentURL() {
    return new URL(this.router.currentURL, window.location.origin);
  }

  get shareURL() {
    let url = new URL(TWEET_INTENT);

    url.searchParams.set('url', this.currentURL);

    if (this.args.text) {
      url.searchParams.set('text', this.args.text);
    }

    if (this.args.hashtags) {
      url.searchParams.set('hashtags', this.args.hashtags);
    }

    if (this.args.via) {
      url.searchParams.set('via', this.args.via);
    }

    return url;
  }

  <template>
    <a
      ...attributes
      href={{this.shareURL}}
      target="_blank"
      rel="external nofollow noopener noreferrer"
      class="share button"
    >
      {{yield}}
    </a>
  </template>
}
