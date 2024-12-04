---@class EngineTagDataBitmapDataTypeEnum : Enum 

---@class EngineTagDataBitmapDataType2dTexture : EngineTagDataBitmapDataTypeEnum 
---@class EngineTagDataBitmapDataType3dTexture : EngineTagDataBitmapDataTypeEnum 
---@class EngineTagDataBitmapDataTypeCubeMap : EngineTagDataBitmapDataTypeEnum 
---@class EngineTagDataBitmapDataTypeWhite : EngineTagDataBitmapDataTypeEnum 

---@alias EngineTagDataBitmapDataType 
---| EngineTagDataBitmapDataType2dTexture
---| EngineTagDataBitmapDataType3dTexture
---| EngineTagDataBitmapDataTypeCubeMap
---| EngineTagDataBitmapDataTypeWhite

---@class EngineTagDataBitmapDataTypeTable 
---@field e2dTexture EngineTagDataBitmapDataType2dTexture
---@field e3dTexture EngineTagDataBitmapDataType3dTexture
---@field eCubeMap EngineTagDataBitmapDataTypeCubeMap
---@field eWhite EngineTagDataBitmapDataTypeWhite
Engine.tag.bitmapDataType = {} 

---@class EngineTagDataBitmapDataFormatEnum : Enum 

---@class EngineTagDataBitmapDataFormatA8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatY8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatAy8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatA8y8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatUnused1 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatUnused2 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatR5g6b5 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatUnused3 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatA1r5g5b5 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatA4r4g4b4 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatX8r8g8b8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatA8r8g8b8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatUnused4 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatUnused5 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatDxt1 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatDxt3 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatDxt5 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatP8Bump : EngineTagDataBitmapDataFormatEnum 

---@alias EngineTagDataBitmapDataFormat 
---| EngineTagDataBitmapDataFormatA8
---| EngineTagDataBitmapDataFormatY8
---| EngineTagDataBitmapDataFormatAy8
---| EngineTagDataBitmapDataFormatA8y8
---| EngineTagDataBitmapDataFormatUnused1
---| EngineTagDataBitmapDataFormatUnused2
---| EngineTagDataBitmapDataFormatR5g6b5
---| EngineTagDataBitmapDataFormatUnused3
---| EngineTagDataBitmapDataFormatA1r5g5b5
---| EngineTagDataBitmapDataFormatA4r4g4b4
---| EngineTagDataBitmapDataFormatX8r8g8b8
---| EngineTagDataBitmapDataFormatA8r8g8b8
---| EngineTagDataBitmapDataFormatUnused4
---| EngineTagDataBitmapDataFormatUnused5
---| EngineTagDataBitmapDataFormatDxt1
---| EngineTagDataBitmapDataFormatDxt3
---| EngineTagDataBitmapDataFormatDxt5
---| EngineTagDataBitmapDataFormatP8Bump

---@class EngineTagDataBitmapDataFormatTable 
---@field tA8 EngineTagDataBitmapDataFormatA8
---@field tY8 EngineTagDataBitmapDataFormatY8
---@field tAy8 EngineTagDataBitmapDataFormatAy8
---@field tA8y8 EngineTagDataBitmapDataFormatA8y8
---@field tUnused1 EngineTagDataBitmapDataFormatUnused1
---@field tUnused2 EngineTagDataBitmapDataFormatUnused2
---@field tR5g6b5 EngineTagDataBitmapDataFormatR5g6b5
---@field tUnused3 EngineTagDataBitmapDataFormatUnused3
---@field tA1r5g5b5 EngineTagDataBitmapDataFormatA1r5g5b5
---@field tA4r4g4b4 EngineTagDataBitmapDataFormatA4r4g4b4
---@field tX8r8g8b8 EngineTagDataBitmapDataFormatX8r8g8b8
---@field tA8r8g8b8 EngineTagDataBitmapDataFormatA8r8g8b8
---@field tUnused4 EngineTagDataBitmapDataFormatUnused4
---@field tUnused5 EngineTagDataBitmapDataFormatUnused5
---@field tDxt1 EngineTagDataBitmapDataFormatDxt1
---@field tDxt3 EngineTagDataBitmapDataFormatDxt3
---@field tDxt5 EngineTagDataBitmapDataFormatDxt5
---@field tP8Bump EngineTagDataBitmapDataFormatP8Bump
Engine.tag.bitmapDataFormat = {} 

---@class EngineTagDataBitmapTypeEnum : Enum 

---@class EngineTagDataBitmapType2dTextures : EngineTagDataBitmapTypeEnum 
---@class EngineTagDataBitmapType3dTextures : EngineTagDataBitmapTypeEnum 
---@class EngineTagDataBitmapTypeCubeMaps : EngineTagDataBitmapTypeEnum 
---@class EngineTagDataBitmapTypeSprites : EngineTagDataBitmapTypeEnum 
---@class EngineTagDataBitmapTypeInterfaceBitmaps : EngineTagDataBitmapTypeEnum 

---@alias EngineTagDataBitmapType 
---| EngineTagDataBitmapType2dTextures
---| EngineTagDataBitmapType3dTextures
---| EngineTagDataBitmapTypeCubeMaps
---| EngineTagDataBitmapTypeSprites
---| EngineTagDataBitmapTypeInterfaceBitmaps

---@class EngineTagDataBitmapTypeTable 
---@field 2dTextures EngineTagDataBitmapType2dTextures
---@field 3dTextures EngineTagDataBitmapType3dTextures
---@field cubeMaps EngineTagDataBitmapTypeCubeMaps
---@field sprites EngineTagDataBitmapTypeSprites
---@field interfaceBitmaps EngineTagDataBitmapTypeInterfaceBitmaps
Engine.tag.bitmapType = {} 

---@class EngineTagDataBitmapFormatEnum : Enum 

---@class EngineTagDataBitmapFormatDxt1 : EngineTagDataBitmapFormatEnum 
---@class EngineTagDataBitmapFormatDxt3 : EngineTagDataBitmapFormatEnum 
---@class EngineTagDataBitmapFormatDxt5 : EngineTagDataBitmapFormatEnum 
---@class EngineTagDataBitmapFormat16Bit : EngineTagDataBitmapFormatEnum 
---@class EngineTagDataBitmapFormat32Bit : EngineTagDataBitmapFormatEnum 
---@class EngineTagDataBitmapFormatMonochrome : EngineTagDataBitmapFormatEnum 

---@alias EngineTagDataBitmapFormat 
---| EngineTagDataBitmapFormatDxt1
---| EngineTagDataBitmapFormatDxt3
---| EngineTagDataBitmapFormatDxt5
---| EngineTagDataBitmapFormat16Bit
---| EngineTagDataBitmapFormat32Bit
---| EngineTagDataBitmapFormatMonochrome

---@class EngineTagDataBitmapFormatTable 
---@field dxt1 EngineTagDataBitmapFormatDxt1
---@field dxt3 EngineTagDataBitmapFormatDxt3
---@field dxt5 EngineTagDataBitmapFormatDxt5
---@field 16Bit EngineTagDataBitmapFormat16Bit
---@field 32Bit EngineTagDataBitmapFormat32Bit
---@field monochrome EngineTagDataBitmapFormatMonochrome
Engine.tag.bitmapFormat = {} 

---@class EngineTagDataBitmapUsageEnum : Enum 

---@class EngineTagDataBitmapUsageAlphaBlend : EngineTagDataBitmapUsageEnum 
---@class EngineTagDataBitmapUsageDefault : EngineTagDataBitmapUsageEnum 
---@class EngineTagDataBitmapUsageHeightMap : EngineTagDataBitmapUsageEnum 
---@class EngineTagDataBitmapUsageDetailMap : EngineTagDataBitmapUsageEnum 
---@class EngineTagDataBitmapUsageLightMap : EngineTagDataBitmapUsageEnum 
---@class EngineTagDataBitmapUsageVectorMap : EngineTagDataBitmapUsageEnum 

---@alias EngineTagDataBitmapUsage 
---| EngineTagDataBitmapUsageAlphaBlend
---| EngineTagDataBitmapUsageDefault
---| EngineTagDataBitmapUsageHeightMap
---| EngineTagDataBitmapUsageDetailMap
---| EngineTagDataBitmapUsageLightMap
---| EngineTagDataBitmapUsageVectorMap

---@class EngineTagDataBitmapUsageTable 
---@field alphaBlend EngineTagDataBitmapUsageAlphaBlend
---@field default EngineTagDataBitmapUsageDefault
---@field heightMap EngineTagDataBitmapUsageHeightMap
---@field detailMap EngineTagDataBitmapUsageDetailMap
---@field lightMap EngineTagDataBitmapUsageLightMap
---@field vectorMap EngineTagDataBitmapUsageVectorMap
Engine.tag.bitmapUsage = {} 

---@class EngineTagDataBitmapSpriteBudgetSizeEnum : Enum 

---@class EngineTagDataBitmapSpriteBudgetSize32x32 : EngineTagDataBitmapSpriteBudgetSizeEnum 
---@class EngineTagDataBitmapSpriteBudgetSize64x64 : EngineTagDataBitmapSpriteBudgetSizeEnum 
---@class EngineTagDataBitmapSpriteBudgetSize128x128 : EngineTagDataBitmapSpriteBudgetSizeEnum 
---@class EngineTagDataBitmapSpriteBudgetSize256x256 : EngineTagDataBitmapSpriteBudgetSizeEnum 
---@class EngineTagDataBitmapSpriteBudgetSize512x512 : EngineTagDataBitmapSpriteBudgetSizeEnum 
---@class EngineTagDataBitmapSpriteBudgetSize1024x1024 : EngineTagDataBitmapSpriteBudgetSizeEnum 

---@alias EngineTagDataBitmapSpriteBudgetSize 
---| EngineTagDataBitmapSpriteBudgetSize32x32
---| EngineTagDataBitmapSpriteBudgetSize64x64
---| EngineTagDataBitmapSpriteBudgetSize128x128
---| EngineTagDataBitmapSpriteBudgetSize256x256
---| EngineTagDataBitmapSpriteBudgetSize512x512
---| EngineTagDataBitmapSpriteBudgetSize1024x1024

---@class EngineTagDataBitmapSpriteBudgetSizeTable 
---@field ze32x32 EngineTagDataBitmapSpriteBudgetSize32x32
---@field ze64x64 EngineTagDataBitmapSpriteBudgetSize64x64
---@field ze128x128 EngineTagDataBitmapSpriteBudgetSize128x128
---@field ze256x256 EngineTagDataBitmapSpriteBudgetSize256x256
---@field ze512x512 EngineTagDataBitmapSpriteBudgetSize512x512
---@field ze1024x1024 EngineTagDataBitmapSpriteBudgetSize1024x1024
Engine.tag.bitmapSpriteBudgetSize = {} 

---@class EngineTagDataBitmapSpriteUsageEnum : Enum 

---@class EngineTagDataBitmapSpriteUsageBlendAddSubtractMax : EngineTagDataBitmapSpriteUsageEnum 
---@class EngineTagDataBitmapSpriteUsageMultiplyMin : EngineTagDataBitmapSpriteUsageEnum 
---@class EngineTagDataBitmapSpriteUsageDoubleMultiply : EngineTagDataBitmapSpriteUsageEnum 

---@alias EngineTagDataBitmapSpriteUsage 
---| EngineTagDataBitmapSpriteUsageBlendAddSubtractMax
---| EngineTagDataBitmapSpriteUsageMultiplyMin
---| EngineTagDataBitmapSpriteUsageDoubleMultiply

---@class EngineTagDataBitmapSpriteUsageTable 
---@field eBlendAddSubtractMax EngineTagDataBitmapSpriteUsageBlendAddSubtractMax
---@field eMultiplyMin EngineTagDataBitmapSpriteUsageMultiplyMin
---@field eDoubleMultiply EngineTagDataBitmapSpriteUsageDoubleMultiply
Engine.tag.bitmapSpriteUsage = {} 

---@class MetaEngineTagDataBitmapDataFlags 
---@field powerOfTwoDimensions boolean 
---@field compressed boolean 
---@field palettized boolean 
---@field swizzled boolean 
---@field linear boolean 
---@field v16u16 boolean 
---@field unused boolean 
---@field makeItActuallyWork boolean 
---@field external boolean 
---@field environment boolean 

---@class MetaEngineTagDataBitmapFlags 
---@field enableDiffusionDithering boolean 
---@field disableHeightMapCompression boolean 
---@field uniformSpriteSequences boolean 
---@field filthySpriteBugFix boolean 
---@field halfHudScale boolean 

---@class MetaEngineTagDataBitmapGroupSprite 
---@field bitmapIndex MetaEngineIndex 
---@field left number 
---@field right number 
---@field top number 
---@field bottom number 
---@field registrationPoint MetaEnginePoint2D 

---@class MetaEngineTagDataBitmapGroupSequence 
---@field name MetaEngineTagString 
---@field firstBitmapIndex MetaEngineIndex 
---@field bitmapCount integer 
---@field sprites TagBlock<MetaEngineTagDataBitmapGroupSprite> 

---@class MetaEngineTagDataBitmapData 
---@field bitmapClass EngineTagClass 
---@field width integer 
---@field height integer 
---@field depth integer 
---@field type EngineTagDataBitmapDataType 
---@field format EngineTagDataBitmapDataFormat 
---@field flags MetaEngineTagDataBitmapDataFlags 
---@field registrationPoint MetaEnginePoint2DInt 
---@field mipmapCount integer 
---@field pixelDataOffset integer 
---@field pixelDataSize integer 
---@field bitmapTagHandle EngineTagHandle 
---@field textureCacheId integer 
---@field texture integer 
---@field pixelsBuffer integer 

---@class MetaEngineTagDataBitmap 
---@field type EngineTagDataBitmapType 
---@field encodingFormat EngineTagDataBitmapFormat 
---@field usage EngineTagDataBitmapUsage 
---@field flags MetaEngineTagDataBitmapFlags 
---@field detailFadeFactor MetaEngineFraction 
---@field sharpenAmount MetaEngineFraction 
---@field bumpHeight MetaEngineFraction 
---@field spriteBudgetSize EngineTagDataBitmapSpriteBudgetSize 
---@field spriteBudgetCount integer 
---@field colorPlateWidth integer 
---@field colorPlateHeight integer 
---@field compressedColorPlateData MetaEngineTagDataOffset 
---@field processedPixelData MetaEngineTagDataOffset 
---@field blurFilterSize number 
---@field alphaBias number 
---@field mipmapCount integer 
---@field spriteUsage EngineTagDataBitmapSpriteUsage 
---@field spriteSpacing integer 
---@field bitmapGroupSequence TagBlock<MetaEngineTagDataBitmapGroupSequence> 
---@field bitmapData TagBlock<MetaEngineTagDataBitmapData> 


