SSplotDataEnv <- function (replist, plot = TRUE, print = FALSE, plotdir = "default", 
                           subplots = 1:2, fleetcol = "default", datatypes = "all", 
                           fleets = "all", fleetnames = "default", ghost = FALSE, pwidth = 6.5, 
                           pheight = 5, punits = "in", res = 300, ptsize = 10, cex.main = 1, 
                           margins = c(5.1, 2.1, 2.1, 8.1), cex = 2, lwd = 12, maxsize = 1, 
                           alphasize = 1, mainTitle = FALSE, verbose = TRUE, subplot = lifecycle::deprecated()) 
{
  if (lifecycle::is_present(subplot)) {
    lifecycle::deprecate_warn(when = "1.45.1", what = "SSplotData(subplot)", 
                              with = "SSplotData(subplots)")
    subplots <- subplot
  }
  plotinfo <- NULL
  startyr <- replist[["startyr"]]
  endyr <- replist[["endyr"]]
  nfleets <- replist[["nfleets"]]
  if (fleetnames[1] == "default") {
    fleetnames <- replist[["FleetNames"]]
  }
  if (plotdir == "default") {
    plotdir <- replist[["inputs"]][["dir"]]
  }
  catch <- replist[["catch"]]
  cpue <- replist[["cpue"]]
  lendbase <- replist[["lendbase"]]
  sizedbase <- replist[["sizedbase"]]
  agedbase <- replist[["agedbase"]]
  condbase <- replist[["condbase"]]
  ghostagedbase <- replist[["ghostagedbase"]]
  ghostcondbase <- replist[["ghostcondbase"]]
  ghostlendbase <- replist[["ghostlendbase"]]
  ladbase <- replist[["ladbase"]]
  wadbase <- replist[["wadbase"]]
  tagdbase1 <- replist[["tagdbase1"]]
  morphcompdbase <- replist[["morphcompdbase"]]
  mnwgt <- replist[["mnwgt"]]
  discard <- replist[["discard"]]
  envdata <- replist[["envdata"]]
  tagrelease <- replist[["tagrelease"]]
  typetable <- matrix(c("catch", "Catches", "cpue", "Abundance indices", 
                        "lendbase", "Length compositions", "sizedbase", "Size compositions", 
                        "agedbase", "Age compositions", "condbase", "Conditional age-at-length compositions", 
                        "ghostagedbase", "Excluded age compositions", "ghostcondbase", 
                        "Excluded conditional age-at-length compositions", "ghostlendbase", 
                        "Excluded length compositions", "ladbase", "Mean length-at-age", 
                        "wadbase", "Mean weight-at-age", "mnwgt", "Mean body weight", 
                        "discard", "Discards", "tagrelease", "Tag releases", 
                        "tagdbase1", "Tag recaptures", "morphcompdbase", "Morph compositions",
                        "envdata", "Environmental data"), 
                      ncol = 2, byrow = TRUE)
  if (!ghost) {
    typetable <- typetable[-grep("ghost", typetable[, 1]), 
    ]
  }
  typenames <- typetable[, 1]
  typelabels <- typetable[, 2]
  ntypes <- 0
  typetable <- NULL
  for (itype in seq_along(typenames)) {
    dat <- get(typenames[itype])
    typename <- typenames[itype]
    if (!is.null(dat) && !all(is.na(dat)) && nrow(dat) > 
        0) {
      ntypes <- ntypes + 1
      for (ifleet in 1:nfleets) {
        allyrs <- NULL
        size <- NULL
        dat.f <- dat[dat[["Fleet"]] == ifleet, ]
        if (nrow(dat.f) > 0) {
          if (typename == "catch") {
            dat.agg <- aggregate(dat.f[["Obs"]], by = list(dat.f[["Yr"]]), 
                                 FUN = sum)
            allyrs <- dat.agg[["Group.1"]][dat.agg[["x"]] > 
                                             0]
            size <- dat.agg[["x"]][dat.agg[["x"]] > 0]
          }
          if (typename == "cpue") {
            dat.f <- dat.f[!is.na(dat.f[["Use"]]) & dat.f[["Use"]] > 
                             0, ]
            if (nrow(dat.f) > 0) {
              dat.agg <- aggregate(dat.f[["SE"]], by = list(dat.f[["Yr"]]), 
                                   FUN = mean)
              allyrs <- dat.agg[["Group.1"]]
              size <- 1/dat.agg[["x"]]
            }
          }
          if (typename == "mnwgt") {
            dat.f <- dat.f[!is.na(dat.f[["Use"]]) & dat.f[["Use"]] > 
                             0, ]
            if (nrow(dat.f) > 0) {
              dat.agg <- aggregate(dat.f[["CV"]], by = list(dat.f[["Yr"]]), 
                                   FUN = mean)
              allyrs <- dat.agg[["Group.1"]]
              size <- 1/dat.agg[["x"]]
            }
          }
          if (typename == "discard") {
            dat.f <- dat.f[!is.na(dat.f[["Use"]]) & dat.f[["Use"]] > 
                             0, ]
            if (nrow(dat.f) > 0) {
              dat.agg <- aggregate(dat.f[["Std_in"]], 
                                   by = list(dat.f[["Yr"]]), FUN = mean)
              allyrs <- dat.agg[["Group.1"]]
              size <- 1/dat.agg[["x"]]
            }
          }
          if (typename %in% c("lendbase", "sizedbase", 
                              "agedbase")) {
            dat.agg <- aggregate(dat.f[["Nsamp_adj"]], 
                                 by = list(dat.f[["Yr"]]), FUN = sum)
            allyrs <- dat.agg[["Group.1"]]
            size <- dat.agg[["x"]]
          }
          if (typename %in% c("ghostagedbase", "ghostcondbase", 
                              "ghostlendbase")) {
            allyrs <- unique(dat.f[["Yr"]])
            size <- rep(1, length(allyrs))
          }
          if (typename %in% c("condbase", "ghostcondbase")) {
            representative.rows <- !duplicated(paste(dat.f[["Yr.S"]], 
                                                     dat.f[["Sexes"]], dat.f[["Lbin_lo"]], dat.f[["Lbin_hi"]]))
            dat.sub <- dat.f[representative.rows, ]
            if (nrow(dat.sub) > 0) {
              dat.agg <- aggregate(dat.sub[["Nsamp_adj"]], 
                                   by = list(dat.sub[["Yr"]]), FUN = sum)
              allyrs <- dat.agg[["Group.1"]]
              size <- dat.agg[["x"]]
            }
          }
          if (typename == "tagrelease" & ifleet == 1) {
            dat.agg <- aggregate(dat.f[["Nrelease"]], 
                                 by = list(dat.f[["Yr"]]), FUN = sum)
            allyrs <- dat.agg[["Group.1"]]
            size <- dat.agg[["x"]]
          }
          if (typename == "envdata") {
            if (nrow(dat.f) > 0) {
              dat.agg <- aggregate(dat.f[["Value"]], by = list(dat.f[["Yr"]]), FUN = mean)
              allyrs <- dat.agg[["Group.1"]]
              size <- abs(dat.agg[["x"]])  # o simplemente dat.agg[["x"]], si aplica
            }
          }
          if (typename == "tagdbase1") {
            dat.f <- dat.f[dat.f[["Used"]] == "yes", 
            ]
            if (nrow(dat.f) > 0) {
              dat.agg <- aggregate(dat.f[["Obs"]], by = list(dat.f[["Yr"]]), 
                                   FUN = sum)
              allyrs <- dat.agg[["Group.1"]][dat.agg[["x"]] > 
                                               0]
              size <- dat.agg[["x"]][dat.agg[["x"]] > 
                                       0]
            }
          }
          if (typename == "morphcompdbase") {
            if (nrow(dat.f) > 0) {
              dat.agg <- aggregate(dat.f[["Nsamp_adj"]], 
                                   by = list(dat.f[["Yr"]]), FUN = sum)
              allyrs <- dat.agg[["Group.1"]][dat.agg[["x"]] > 
                                               0]
              size <- dat.agg[["x"]][dat.agg[["x"]] > 
                                       0]
            }
          }
          if (typename %in% c("ladbase", "wadbase")) {
            dat.f <- dat.f[dat.f[["Used"]] == "yes", 
            ]
            if (nrow(dat.f) > 0) {
              dat.agg <- aggregate(dat.f[["Nsamp_adj"]], 
                                   by = list(dat.f[["Yr"]]), FUN = sum)
              allyrs <- dat.agg[["Group.1"]]
              size <- dat.agg[["x"]]
            }
          }
          if (!is.null(allyrs) & length(allyrs) > 0) {
            unique.index <- which(!duplicated(allyrs))
            yrs <- floor(allyrs[unique.index])
            size.sorted <- size[unique.index][order(yrs)]
            yrs.sorted <- yrs[order(yrs)]
            
            fleet_id <- ifelse(typename == "envdata", nfleets + 2,
                               ifelse(typename == "tagrelease", nfleets + 1, ifleet))
            
            typetable <- rbind(typetable, data.frame(yr = yrs.sorted, 
                                                     fleet = fleet_id, 
                                                     itype = ntypes, 
                                                     typename = typename, 
                                                     size = size.sorted, 
                                                     stringsAsFactors = FALSE))
          }
        }
      }
    }
  }
  if (fleets[1] == "all") {
    fleets <- 1:(nfleets + 1)
  }
  if (datatypes[1] == "all") {
    datatypes <- typenames
  }
  typetable2 <- typetable[typetable[["fleet"]] %in% fleets & 
                            typetable[["typename"]] %in% datatypes, ]
  ntypes <- length(unique(typetable2[["itype"]]))
  fleets2 <- sort(unique(typetable2[["fleet"]]))
  fleets2 <- fleets2[fleets2 %in% c(0, fleets)]
  nfleets2 <- length(fleets2)
  if (nfleets + 1 %in% fleets2) {
    fleetnames <- c(fleetnames, "unassigned")
  }
  if (fleetcol[1] == "default") {
    if (nfleets2 > 3) 
      fleetcol <- rich.colors.short(nfleets2 + 1)[-1]
    if (nfleets2 == 1) 
      fleetcol <- "grey40"
    if (nfleets2 == 2) 
      fleetcol <- rich.colors.short(nfleets2)
    if (nfleets2 == 3) 
      fleetcol <- c("blue", "red", "green3")
  }
  else {
    if (length(fleetcol) < nfleets2) 
      fleetcol <- rep(fleetcol, nfleets2)
  }
  plotdata <- function(datasize) {
    par(mar = margins)
    xlim <- c(-1, 1) + range(typetable2[["yr"]], na.rm = TRUE)
    yval <- 0
    ymax <- sum(as.data.frame(table(typetable2[["fleet"]], 
                                    typetable2[["itype"]]))$Freq > 0)
    main.temp <- ""
    if (mainTitle) {
      main.temp <- if (datasize) {
        "Data by type and year, circle area is relative to precision within data type"
      }
      else {
        "Data by type and year"
      }
    }
    plot(0, xlim = xlim, ylim = c(0, ymax + 2 * ntypes + 
                                    0.5), axes = FALSE, xaxs = "i", yaxs = "i", type = "n", 
         xlab = "Year", ylab = "", main = main.temp, cex.main = cex.main)
    xticks <- 5 * round(xlim[1]:xlim[2]/5)
    abline(v = xticks, col = "grey", lty = 3)
    axistable <- data.frame(fleet = rep(NA, ymax), yval = NA)
    itick <- 1
    for (itype in rev(unique(typetable2[["itype"]]))) {
      size.max <- max(typetable2[["size"]][typetable2[["itype"]] == 
                                             itype], na.rm = TRUE)
      if (size.max > 0) {
        typetable2[["size"]][typetable2[["itype"]] == 
                               itype] <- typetable2[["size"]][typetable2[["itype"]] == 
                                                                itype]/size.max
      }
      else {
        typetable2[["size"]][typetable2[["itype"]] == 
                               itype] <- 0
      }
      typename <- unique(typetable2[["typename"]][typetable2[["itype"]] == 
                                                    itype])
      type.fleets <- sort(unique(typetable2[["fleet"]][typetable2[["itype"]] == 
                                                         itype]))
      for (ifleet in rev(type.fleets)) {
        yrs <- typetable2[["yr"]][typetable2[["fleet"]] == 
                                    ifleet & typetable2[["itype"]] == itype]
        if (length(yrs) > 0) {
          col <- fleetcol[which(fleets2 == ifleet)]
          size.cex <- typetable2[["size"]][typetable2[["fleet"]] == 
                                             ifleet & typetable2[["itype"]] == itype]
          yval <- yval + 1
          x <- min(yrs):max(yrs)
          n <- length(x)
          y <- rep(yval, n)
          y[!x %in% yrs] <- NA
          solo <- rep(FALSE, n)
          if (n == 1) 
            solo <- 1
          if (n == 2 & yrs[2] != yrs[1] + 1) 
            solo <- rep(TRUE, 2)
          if (n >= 3) {
            for (i in 2:(n - 1)) if (is.na(y[i - 1]) & 
                                     is.na(y[i + 1])) 
              solo[i] <- TRUE
            if (is.na(y[2])) 
              solo[1] <- TRUE
            if (is.na(y[n - 1])) 
              solo[n] <- TRUE
          }
          if (!datasize) {
            points(x[solo], y[solo], pch = 16, cex = cex, 
                   col = col)
            lines(x, y, lwd = lwd, col = col)
          }
          else {
            x <- x[!is.na(y)]
            y <- y[!is.na(y)]
            symbols(x = x, y = y, circles = sqrt(size.cex) * 
                      maxsize, bg = adjustcolor(col, alpha.f = alphasize), 
                    add = TRUE, inches = FALSE)
          }
          axistable[itick, ] <- c(ifleet, yval)
          itick <- itick + 1
        }
      }
      yval <- yval + 2
      if (itype != 1) 
        abline(h = yval + 0.3, col = "grey", lty = 3)
      text(mean(xlim), yval - 0.3, typelabels[typenames == 
                                                typename], font = 2)
    }
    axis(4, at = axistable[["yval"]], labels = fleetnames[axistable[["fleet"]]], 
         las = 1)
    box()
    axis(1, at = xticks)
  }
  if (1 %in% subplots) {
    if (plot) {
      plotdata(datasize = FALSE)
    }
    if (print) {
      caption <- "Data presence by year for each fleet and data type."
      file <- "data_plot.png"
      plotinfo <- save_png(plotinfo = plotinfo, file = file, 
                           plotdir = plotdir, pwidth = pwidth, pheight = pheight, 
                           punits = punits, res = res, ptsize = ptsize, 
                           caption = caption)
      plotdata(datasize = FALSE)
      dev.off()
    }
  }
  if (2 %in% subplots) {
    if (plot) {
      plotdata(datasize = TRUE)
    }
    if (print) {
      caption <- paste("Data presence by year for each fleet, where circle area is <br> ", 
                       "relative within a data type. Circles are proportional to <br> ", 
                       "total catch for catches; to precision for indices, discards, and <br> ", 
                       "mean body weight observations; and to total sample size for <br>", 
                       "compositions and mean weight- or length-at-age observations. <br>", 
                       "Observations excluded from the likelihood have <br>", 
                       "equal size for all years. <br>", "Note that since the circles are are scaled relative <br> ", 
                       "to maximum within each type, the scaling within separate plots <br> ", 
                       "should not be compared.")
      if (replist[["nseasons"]] > 1) {
        caption <- paste(caption, "<br>This is a seasonal model, so scaling is based on either <br> ", 
                         "the sum of samples within each year (for things like comps) <br> ", 
                         "or the average among observations within a year (for  <br> ", 
                         "things like index uncertainty).")
      }
      file <- "data_plot2.png"
      plotinfo <- save_png(plotinfo = plotinfo, file = file, 
                           plotdir = plotdir, pwidth = pwidth, pheight = pheight, 
                           punits = punits, res = res, ptsize = ptsize, 
                           caption = caption)
      plotdata(datasize = TRUE)
      dev.off()
    }
  }
  returnlist <- list(typetable2 = typetable2)
  if (!is.null(plotinfo)) {
    plotinfo[["category"]] <- "Data"
    returnlist[["plotinfo"]] <- plotinfo
  }
  return(invisible(returnlist))
}






