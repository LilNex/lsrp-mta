bool vertical = false;
float3 RGB = float3(0,0,0);
float3 RGB_Chg = float3(0,0,0);
float3 StaticMode = float3(1,1,1);
bool isReversed = false;
bool useMaskTexture = false;
texture maskTexture;

SamplerState maskSampler{
	Texture = maskTexture;
};

float4 RGBComponent(float2 tex:TEXCOORD0,float4 color:COLOR0):COLOR0{
	float kValue = tex[!vertical];
	kValue = isReversed?(1-kValue):kValue;
	float3 nRGB = RGB*StaticMode;
	float3 rgb = RGB_Chg*kValue+nRGB*(1-RGB_Chg);
	color.rgb = float3(rgb.x,rgb.y,rgb.z);
	float3 _maskRGB = tex2D(maskSampler,tex).rgb;
	color.a *= useMaskTexture?((_maskRGB.r+_maskRGB.g+_maskRGB.b)/3):1;
	return color;
}

technique DGSRGB{
	pass P0{
		PixelShader = compile ps_2_0 RGBComponent();
	}
}
