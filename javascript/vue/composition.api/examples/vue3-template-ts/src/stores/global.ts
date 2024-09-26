// import { ref } from 'vue'
import { defineStore } from 'pinia'

export const useGlobalStore = defineStore('counter', () => {
  const userName = 'Osman Kayı'
  const count = 0

  return { userName, count }
})
