# Folding fixture

Headings and ordinary text stay open.

## Backticks

```lua fold
print('fold')
```

## Case-insensitive marker

```lua FoLd
print('fold')
```

## Angle-bracket marker

```lua <fold>
print('fold')
```

## Tilde fence

~~~sh fold
echo fold
~~~

## Longer fence

````text fold
```
````

## Empty block

```text fold
```

## Block quote

> ```lua fold
> print('fold')
> ```

## List item

- item

  ```lua fold
  print('fold')
  ```

## Adjacent blocks

```lua fold
print('first')
```
~~~sh fold
echo second
~~~

## No marker: stays open

```lua
print('open')
```

## Substring: stays open

```lua unfold
print('open')
```

## Unclosed fence: folds to EOF

```text fold
still inside the block
