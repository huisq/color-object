import { DubheConfig } from '@0xobelisk/sui-common';

export const dubheConfig = {
  name: 'color_object',
  description: 'example',
  systems: ['color_object'],
  schemas: {
    color_object: {
      structure: {
        red: 'StorageValue<u8>',
        green: 'StorageValue<u8>',
        blue: 'StorageValue<u8>',
      },
    },
  },
} as DubheConfig;
