# Set Server Date Time Property on PHP

```bash
# optional chaining (?.) ve nullish coalescing operator (??)
GLOBAL_SETTINGS.SERVER_TIME = result?.serverDateTime ?? "";

# This script checks if the result object exists and has the serverDateTime property.
# If the property exists, its value is assigned to the GLOBAL_SETTINGS.SERVER_TIME variable.
# If the property does not exist, or if its value is null or undefined, an empty string ("") is assigned.
```
