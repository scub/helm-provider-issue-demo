## Merge behavior

When a write_only value is merged in, anywhere a list of objects exists the current behavior of the provider is to completely overwrite that element.


Supplied values:

```yaml
my_cool_map:
  - x: 1
    y: 2
```

set_wo update:

```yaml
my_cool_map:
  - x: 3
```

Result:

```yaml
my_cool_map:
  - x: 3
```

Desired result:

```yaml
my_cool_map:
  - x: 3
    y: 2
```


Running it:


```bash
tofu init ; tofu apply -auto-approve

kubectl describe cm -n testing testing-config # dump the full config

helm delete -n testing testing # clean up
```


This is a demo for https://github.com/hashicorp/terraform-provider-helm/pull/1881