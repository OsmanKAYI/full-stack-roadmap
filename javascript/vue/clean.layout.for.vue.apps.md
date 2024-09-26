# Clean Layout Architecture for Vue Applications

Layouts are essential for reducing code repetition and creating maintainable, professional-looking applications. While Nuxt provides an elegant solution out of the box, Vue does not address layouts in its official documentation. This can lead to sub-optimal solutions. Here, we present a scalable architecture for layouts in Vue.

## The Requirements

Our layout architecture must:

- Allow a page to declare its layout and the components for each section.
- Ensure changes to one page do not affect others.
- Declare common layout parts only once.

## Setting up Vue Router

Skip this section if you are familiar with [vue-router](https://router.vuejs.org/).

### Install vue-router

```bash
npm i -D vue-router@4
```

### Declare the Routes

```typescript
const routes = [
  { path: "/", component: () => import("./pages/HomePage.vue") },
  { path: "/explore", component: () => import("./pages/ExplorePage.vue") },
];
```

### Install as a Plugin

```typescript
import { createApp } from "vue";
import { createRouter, createWebHashHistory } from "vue-router";
import App from "./App.vue";
import routes from "./routes.ts";

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

const app = createApp(App);

app.use(router);

app.mount("#app");
```

### Update `App.vue`

```html
<template>
  <router-view />
</template>
```

Now, we can navigate between two pages. Let's add content to these pages.

## The Pages

We'll create the following pages: Home, Explore, Article, and 404. And three layouts: three-column, two-column, and blank.

### HomePage.vue

```html
<script setup lang="ts">
import ThreeColumnLayout from "../layouts/ThreeColumnLayout.vue";
import ArticleCard from "../components/ArticleCard.vue";
import WidgetFriendSuggestions from "../components/WidgetFriendSuggestions.vue";
import useArticles from "../composables/useArticles";
const articles = useArticles().getArticles();
</script>

<template>
  <ThreeColumnLayout>
    <h2 class="text-3xl font-bold mb-4">Homepage content</h2>
    <ArticleCard v-for="article in articles" :key="article.id" :article="article" />
    <template #aside>
      <WidgetFriendSuggestions />
    </template>
  </ThreeColumnLayout>
</template>
```

### ThreeColumnLayout.vue

```html
<script setup>
import AppNavigation from "../components/AppNavigation.vue";
import AppFooter from "../components/AppFooter.vue";
import AppLogo from "../components/AppLogo.vue";
</script>

<template>
  <div class="three-column-layout">
    <header>
      <AppLogo />
      <AppNavigation />
    </header>
    <main>
      <slot />
    </main>
    <aside>
      <slot name="aside" />
      <AppFooter />
    </aside>
  </div>
</template>

<style scoped lang="scss">
.three-column-layout {
  display: grid;
  grid-template-areas:
    "header"
    "main"
    "aside";
  header {
    grid-area: header;
    margin-top: 30px;
  }
  main {
    grid-area: main;
    margin-top: 10px;
    padding: 20px;
  }
  aside {
    grid-area: aside;
    margin-top: 10px;
    padding: 20px;
  }
  @media (min-width: 768px) {
    grid-template-columns: 1fr 3fr 1fr;
    grid-template-areas: "header main aside";
  }
}
</style>
```

### ArticlePage.vue

```html
<script setup lang="ts">
import ThreeColumnLayout from "../layouts/ThreeColumnLayout.vue";
import WidgetRelatedContent from "../components/WidgetRelatedContent.vue";
import WidgetFriendSuggestions from "../components/WidgetFriendSuggestions.vue";
import { useRoute } from "vue-router";
import useArticles from "../composables/useArticles";
const article = useArticles().getArticle(useRoute().params.id);
</script>

<template>
  <ThreeColumnLayout>
    <h2 class="text-3xl font-bold mb-4">{{ article.title }}</h2>
    <div class="max-w-md" v-html="article.description"></div>
    <template #aside>
      <WidgetFriendSuggestions />
      <WidgetRelatedContent />
    </template>
  </ThreeColumnLayout>
</template>
```

## Two Column Layout

### TwoColumnLayout.vue

```html
<script setup>
import AppNavigation from "../components/AppNavigation.vue";
import AppLogo from "../components/AppLogo.vue";
import AppFooter from "../components/AppFooter.vue";
</script>

<template>
  <div class="two-column-layout">
    <header>
      <AppLogo />
      <AppNavigation />
    </header>
    <main>
      <slot />
      <AppFooter />
    </main>
  </div>
</template>

<style scoped>
.two-column-layout {
  display: flex;
  @media (max-width: 768px) {
    flex-direction: column;
  }
}
header {
  flex-basis: 20%;
  margin-top: 30px;
}
main {
  flex-basis: 80%;
  margin-top: 10px;
  padding: 20px;
}
</style>
```

### ExplorePage.vue

```html
<script setup lang="ts">
import TwoColumnLayout from "../layouts/TwoColumnLayout.vue";
import ExploreItem from "../components/ExploreItem.vue";
import useArticles from "../composables/useArticles";
const articles = useArticles().getExploreArticles();
</script>

<template>
  <TwoColumnLayout>
    <h2 class="text-3xl font-bold mb-12">
      Latest content on <a target="_blank" href="https://dev.to/">Dev.to</a>
    </h2>
    <div class="grid lg:grid-cols-3 gap-6">
      <ExploreItem v-for="article in articles" :key="article.id" :article="article" />
    </div>
  </TwoColumnLayout>
</template>
```

This architecture ensures clean, maintainable, and scalable layout management in Vue applications.

The project above is available on [GitHub](https://github.com/fadamakis/vue-layouts) and you can test it live [here](https://fadamakis.github.io/vue-layouts/#/).

**Ref:** [Fotis Adamakis - Medium](https://fadamakis.com/clean-layout-architecture-for-vue-applications-a738201a2a1e)
