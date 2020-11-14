private int hitBoxPadding = 8;

private boolean overWithHitBoxPadding(int x, int y, int width, int height) {
  return overRect(
    x - hitBoxPadding,
    y - hitBoxPadding,
    width + 2 * hitBoxPadding,
    height + 2 * hitBoxPadding
  );
}

private void rectWithHitBoxPadding(
  int x,
  int y,
  int width,
  int height,
  int radius
) {
  rect(
    x - hitBoxPadding,
    y - hitBoxPadding,
    width + 2 * hitBoxPadding,
    height + 2 * hitBoxPadding,
    radius
  );

  return;
}
