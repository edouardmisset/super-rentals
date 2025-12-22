import Component from '@glimmer/component';
import ENV from 'super-rentals/config/environment';

// File 1 .ts
export interface MapSignature {
  // The arguments accepted by the component
  Args: {
    lng: number;
    lat: number;
    zomm: number;
    width: number;
    height: number;
  };
  // Any blocks yielded by the component
  Blocks: {
    default: [];
  };
  // The element to which `...attributes` is applied in the component template
  Element: null;
}

const MAPBOX_API = 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static';

export default class Map extends Component<MapSignature> {
  get src() {
    let { lng, lat, width, height, zoom } = this.args;

    let coordinates = `${lng},${lat},${zoom}`;
    let dimensions = `${width}x${height}`;
    let accessToken = `access_token=${this.token}`;

    return `${MAPBOX_API}/${coordinates}/${dimensions}@2x?${accessToken}`;
  }

  get token() {
    return encodeURIComponent(ENV.MAPBOX_ACCESS_TOKEN);
  }

  // File 2 .hbs
  <template>
    <div class="map">
      <img
        alt="Map image at coordinates {{@lat}},{{@lng}}"
        ...attributes
        src={{this.src}}
        width={{@width}}
        height={{@height}}
      />
    </div>
  </template>
}
