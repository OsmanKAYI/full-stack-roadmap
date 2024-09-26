# TypeScript Type Narrowing

TypeScript has some helpful error messages, especially with the Total TypeScript VS Code extension.

But sometimes the issues that TypeScript brings up don't really seem like that big of a deal.

Take this User type for example, where profile is optional:

```ts
type User = {
  id: number;
  username: string;
  profile?: {
    bio: string;
    website: string;
  };
};
```

If you create an exampleUser and try to access exampleUser.profile.bio directly, TypeScript will throw an error:

>'exampleUser.profile' is possibly 'undefined'

One way to work around this error is to create a function that checks if the profile property exists before accessing bio:

```ts
const getUserBio = (user: User) => {
  if (user.profile) {
    return user.profile.bio; // No more error!
  } else {
    return "User has no profile"; 
  }
};
```

In this case, the if (user.profile) check acts as a type guard, telling TypeScript that within that block, user.profile is guaranteed to exist. Since the bio is a required property of profile, TypeScript is happy.

While this was a simple example, don't underestimate how helpful type guards can be in narrowing the types of your variables.

The process of narrowing helps us help TypeScript to better understand our code, which in turn enables better inference and autocompletions.

In addition to checking for .Whatever, you can create type guards with operators like typeof, instanceof, and in.

But the really cool stuff comes from using advanced TypeScript features like type predicates, discriminated unions, and assertion functions for narrowing.
