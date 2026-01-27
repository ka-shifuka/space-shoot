uniform float uWarp;
uniform float uScan;
uniform bool uIsCrtEnable;
vec4 effect(vec4 color, sampler2D texture, vec2 uv, vec2 screen_coord) {
   if (uIsCrtEnable) {
      vec2 dc = abs(0.5 - uv);
      dc *= dc;

      // warp the fragment coordinates
      uv.x -= 0.5;
      uv.x *= 1.0 + (dc.y * (0.3 * uWarp));
      uv.x += 0.5;
      uv.y -= 0.5;
      uv.y *= 1.0 + (dc.x * (0.4 * uWarp));
      uv.y += 0.5;

      // sample inside boundaries, otherwise set to black
      if (uv.y > 1.0 || uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0)
         return vec4(0.0, 0.0, 0.0, 1.0);
      else
      {
         // determine if we are drawing in a scanline
         float apply = abs(sin(screen_coord.y) * 0.5 * uScan);

         vec4 pixel = texture2D(texture, uv);
         return vec4(mix(pixel.rgb, vec3(0.0), apply), 1.0);
      }
   } else {
      vec4 pixel = texture2D(texture, uv);
      return pixel;
   }
}
