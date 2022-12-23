import { SmartInfoEntity } from '@app/database/entities/smart-info.entity';

export class SmartInfoResponseDto {
  id?: string;
  tags?: string[] | null;
  objects?: string[] | null;
  ocr_info?: string | null;
}

export function mapSmartInfo(entity: SmartInfoEntity): SmartInfoResponseDto {
  return {
    id: entity.id,
    tags: entity.tags,
    objects: entity.objects,
    ocr_info: entity.ocr_info,
  };
}
