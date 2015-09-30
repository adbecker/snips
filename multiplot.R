require(ggplot2)
grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 2)))
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

print(p1,vp=vplayout(1,1))
print(p2,vp=vplayout(1,2))


