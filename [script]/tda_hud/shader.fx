texture tex0;       // texture
texture maskTex0;   // mask
float finalAlpha;

sampler sBase = sampler_state { 
	Texture = (tex0);
	MinFilter = Linear;
	MagFilter = Linear;
	AddressU = Clamp;
	AddressV = Clamp; 
};
sampler sAlpha = sampler_state { Texture = (maskTex0); };

float4 ps( float2 Base : TEXCOORD0 ) : COLOR
{
    float4 color;
    float4 alpha;
    color = tex2D( sBase, Base.xy );
    alpha = tex2D( sAlpha, Base.xy );
    color.a = alpha.r*finalAlpha;
    return color;
}

technique mask
{
    pass p0
    {
		AlphaBlendEnable = TRUE;
		DestBlend = INVSRCALPHA;
		SrcBlend = SRCALPHA;
		VertexShader = null;
        PixelShader = compile ps_2_0 ps();
    }
}
