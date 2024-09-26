# Working with a Constants Folder

## TL;DR

- Use a `constants.ts` file to store project-wide constants.
- Import constants wherever needed in the project.
- Define types in `types.ts` if necessary.
- Use the `.env` file for environment-specific constants like API URLs.

You can define constants used throughout the site with the following methods:

## 1. Create a Separate Constants File (`constants.ts`)

Creating a `constants.ts` file to collect constants in a centralized location helps maintain project organization and provides easy access to constants.

For example, you can create a `constants.ts` file in the `src` folder of your project:

```typescript
// src/constants.ts
export const MYCONSTANTS = {
  API_BASE_URL: 'https://api.example.com',
  MAX_SEAT_SELECTION: 4,
  SEAT_TYPES: {
    AVAILABLE: 'available',
    TAKEN: 'taken',
    RESERVED: 'reserved'
  },
  GENDER: {
    MALE: 'male',
    FEMALE: 'female'
  }
};
```

## 2. Using Constants in the Project

You can import the `constants.ts` file wherever needed:

```typescript
// For example, in a Vue component or any TypeScript file
import { MYCONSTANTS } from 'src/constants';

console.log(`API URL: ${MYCONSTANTS.API_BASE_URL}`);
console.log(`Max seat selection: ${MYCONSTANTS.MAX_SEAT_SELECTION}`);
console.log(`Available seat type: ${MYCONSTANTS.SEAT_TYPES.AVAILABLE}`);
```

## 3. Using `types.ts` for Type Definitions

If you want to define types for the constants, you can add them to a `types.ts` file:

```typescript
// src/types.ts
export type EGender = 'male' | 'female';
export type ESeatType = 'available' | 'taken' | 'reserved';
```

## 4. Using Constants in Pinia Store

You can use constants in a Pinia store by importing them similarly:

```typescript
import { defineStore } from 'pinia';
import { MYCONSTANTS } from 'src/constants';

export const useSeatStore = defineStore('seat', {
  state: () => ({
    maxSeats: MYCONSTANTS.MAX_SEAT_SELECTION,
    seatTypes: MYCONSTANTS.SEAT_TYPES
  })
});
```

## 5. Using `.env` for Environmental Constants

For environment-specific constants like API URLs, you can use the `.env` file in a Quasar project:

- Create a `.env` file and add the constants:

```bash
VUE_APP_API_URL=https://api.example.com
```

- To use them:

```typescript
console.log(process.env.VUE_APP_API_URL);
```

## Summary

- Define constants in a centralized `constants.ts` file.
- Import constants where needed.
- Use `.env` for environment-based constants.

This approach helps keep your constants organized, easily accessible, and manageable.

- To learn how to [use axios with boot file](../quasar/use.axios.with.boot.md), you can follow the link.
