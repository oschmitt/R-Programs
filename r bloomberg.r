library(RBloomberg)

## Not run:
conn <- blpConnect()
## Snapshot
eda <- blpGetData(conn, c("ED5 Comdty","ED6 Comdty","ED7 Comdty",
"ED8 Comdty"), "BID")
## Historical (last 30 days)
edb <- blpGetData(conn, "ED1 Comdty", "PX_LAST",
start=as.chron(Sys.time() - 86400 * 30))
## Intraday bars (last hour in 2 min bars)
edc <- blpGetData(conn, "ED1 Comdty", c("BID","ASK"),
start=as.chron(Sys.time() - 3600), barfields="OPEN", barsize=2)
## Tick-by-tick (3 minutes starting an hour ago)
blpReadFields 5
edd <- blpGetData(conn, "ED1 Comdty", c("BID"),
start=as.chron(Sys.time() - 3600),
end=as.chron(Sys.time() - 3420), barsize=0)
blpDisconnect(conn)
## End(Not run)

