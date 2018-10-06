library(data.table)

files_location <- paste0(getwd(), "/Data")
files_number<-length(list.files(files_location, pattern = glob2rx("*.txt")))

# check for matching files

Acquisitions <- list.files(files_location, pattern = glob2rx("Acquisition*.txt"), full.names=TRUE)
Performance <- list.files(files_location, pattern = glob2rx("Performance*.txt"), full.names=TRUE)

Acquisitions_Variables <- c("LOAN_ID", "ORIG_CHN", "Seller.Name", "ORIG_RT", "ORIG_AMT", "ORIG_TRM",
                            "ORIG_DTE", "FRST_DTE", "OLTV", "OCLTV", "NUM_BO", "DTI", "CSCORE_B",
                            "FTHB_FLG", "PURPOSE", "PROP_TYP", "NUM_UNIT", "OCC_STAT", "STATE",
                            "ZIP_3", "MI_PCT", "Product.Type", "CSCORE_C", "MI_TYPE", "RELOCATION_FLG")

Acquisition_ColClasses <- c("character", "character", "character", "numeric", "numeric", "integer",
                            "character", "character", "numeric", "numeric", "character", "numeric",
                            "numeric", "character", "character", "character", "character", "character",
                           "character", "character", "numeric", "character", "numeric", "numeric", "character")

dt_Acquistions <- fread(Acquisitions[1], sep = "|", colClasses = Acquisition_ColClasses, showProgress = FALSE)
setnames(dt_Acquistions, Acquisitions_Variables)
setkey(dt_Acquistions, "LOAN_ID")

Performance_Variables <- c("LOAN_ID", "Monthly.Rpt.Prd", "Servicer.Name", "LAST_RT", "LAST_UPB",
                           "Loan.Age", "Months.To.Legal.Mat", "Adj.Month.To.Mat", "Maturity.Date",
                           "MSA", "Delq.Status", "MOD_FLAG", "Zero.Bal.Code", "ZB_DTE", "LPI_DTE",
                           "FCC_DTE","DISP_DT", "FCC_COST", "PP_COST", "AR_COST", "IE_COST", "TAX_COST",
                           "NS_PROCS", "CE_PROCS", "RMW_PROCS", "O_PROCS", "NON_INT_UPB",
                           "PRIN_FORG_UPB_FHFA", "REPCH_FLAG", "PRIN_FORG_UPB_OTH", "TRANSFER_FLG")

Performance_ColClasses <- c("character", "character", "character", "numeric", "numeric", "numeric",
                            "numeric", "numeric", "character", "character", "character", "character", 
                            "character", "character", "character", "character", "character", "numeric",
                            "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric",
                            "numeric", "numeric", "numeric", "character", "numeric", "character")

dt_Performance <- fread(Performance[1], sep = "|", colClasses = Performance_ColClasses, showProgress = TRUE)

dt_Performance

setnames(dt_Performance, Performance_Variables)
setkey(dt_Performance, "LOAN_ID")



n <- 1e7 
X <- rnorm(n) 
model <- function(x) prod(dnorm(x, mean = X, sd = abs(X)))
system.time(model(rnorm(n)))


system.time(replicate(10, model(rnorm(n))))




tables()



