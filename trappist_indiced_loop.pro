pro Trappist_indices_loop

; ----------------------------------------------------------------------------------------------------------------------
; --------------------------------------------Prism Indices-------------------------------------------------------
; ----------------------------------------------------------------------------------------------------------------------
cd, '/Users/eileengonzales/Dropbox/BDNYC/BDNYC_Research/IDL/Indices/Spectra_Trappist/Prism'
prism_txt=file_search('*.txt')
prism_fits=file_search('*.fits')

openw, f, '/Users/eileengonzales/Dropbox/BDNYC/BDNYC_Research/IDL/Indices/Prism_Out.txt', width=250, /GET_LUN
printf,f,'filename  ','feh_z    ','index1   ','vo_z ','index2   ','ki_j ','index4   ','hcont    ','index5   '
for i=0,n_elements(prism_txt)-1 do begin
    name_use=prism_txt[i]
    readcol,prism_txt[i],wl,flux,err,/silent
    feh_z=ALLERS13_INDEX(wl,flux,index1,/feh_z,/prz)
    vo_z=ALLERS13_INDEX(wl,flux,index2,/vo_z,/prz)
    ki_j=ALLERS13_INDEX(wl,flux,index4,/ki_j,/prz)
    hcont=ALLERS13_INDEX(wl,flux,index5,/hcont,/prz)
    printf,f,name_use,feh_z,index1,vo_z,index2,ki_j,index4,hcont,index5
endfor
free_lun,f

openw, f, '/Users/eileengonzales/Dropbox/BDNYC/BDNYC_Research/IDL/Indices/Prism_Out_fits.txt', width=250, /GET_LUN
printf,f,'filename  ','feh_z    ','index1   ','vo_z ','index2   ','ki_j ','index4   ','hcont    ','index5   '
for i=0,n_elements(prism_fits)-1 do begin
    name_use=prism_fits[i]
    data = readfits(prism_fits[i],h,/silent)
    wl = data[*,0]
    fl = data[*,1]
    err = data[*,2]
    feh_z=ALLERS13_INDEX(wl,flux,index1,/feh_z,/prz)
    vo_z=ALLERS13_INDEX(wl,flux,index2,/vo_z,/prz)
    ki_j=ALLERS13_INDEX(wl,flux,index4,/ki_j,/prz)
    hcont=ALLERS13_INDEX(wl,flux,index5,/hcont,/prz)
    printf,f,name_use,feh_z,index1,vo_z,index2,ki_j,index4,hcont,index5
endfor
free_lun,f

; ----------------------------------------------------------------------------------------------------------------------
; -------------------------------------------- SXD Indices -------------------------------------------------------
; ----------------------------------------------------------------------------------------------------------------------
cd, '/Users/eileengonzales/Dropbox/BDNYC/BDNYC_Research/IDL/Indices/Spectra_Trappist/SXD'
SXD_txt=file_search('*.txt')
SXD_fits=file_search('*.fits')
;SXD2_fits=file_search('*.fits')  ; ---Appears to work, so maybe correct and only SXD, need to put all in same folder to work
;SXD_fits_total= [SXD_fits,SXD2_fits]

openw, f, '/Users/eileengonzales/Dropbox/BDNYC/BDNYC_Research/IDL/Indices/SXD_txtOut.txt', width=250, /GET_LUN
printf,f,'filename  ','feh_z    ','index1   ','vo_z ','index2   ','feh_j    ', 'index3  ','ki_j ','index4   ','hcont    ','index5   '
for i=0,n_elements(SXD_txt)-1 do begin
    name_use=SXD_txt[i]
    readcol,SXD_txt[i],wl,flux,err,/silent
    feh_z=ALLERS13_INDEX(wl,flux,index1,/feh_z,/SXD)
    vo_z=ALLERS13_INDEX(wl,flux,index2,/vo_z,/SXD)
    feh_j=ALLERS13_INDEX(wl,flux,index3,/feh_j,/SXD)
    ki_j=ALLERS13_INDEX(wl,flux,index4,/ki_j,/SXD)
    hcont=ALLERS13_INDEX(wl,flux,index5,/hcont,/SXD)
    printf,f,name_use,feh_z,index1,vo_z,index2,feh_j,index3,ki_j,index4,hcont,index5
endfor
free_lun,f

openw, f, '/Users/eileengonzales/Dropbox/BDNYC/BDNYC_Research/IDL/Indices/SXD_fitsOut.txt', width=250, /GET_LUN
printf,f,'filename  ','feh_z    ','index1   ','vo_z ','index2   ','feh_j    ', 'index3  ','ki_j ','index4   ','hcont    ','index5   '
for i=0,n_elements(SXD_fits)-1 do begin
    name_use=SXD_fits[i]
    data = readfits(SXD_fits[i],h,/silent)
    wl = data[*,0]
    flux = data[*,1]
    err = data[*,2]
    feh_z=ALLERS13_INDEX(wl,flux,index1,/feh_z,/SXD)
    vo_z=ALLERS13_INDEX(wl,flux,index2,/vo_z,/SXD)
    feh_j=ALLERS13_INDEX(wl,flux,index3,/feh_j,/SXD)
    ki_j=ALLERS13_INDEX(wl,flux,index4,/ki_j,/SXD)
    hcont=ALLERS13_INDEX(wl,flux,index5,/hcont,/SXD)
    printf,f,name_use,feh_z,index1,vo_z,index2,feh_j,index3,ki_j,index4,hcont,index5
endfor
free_lun,f

; ----------- Attemping the SXD+LXD folder
cd, '/Users/eileengonzales/Dropbox/BDNYC/BDNYC_Research/IDL/Indices/Spectra_Trappist/SXD+LXD'
SXD2_fits=file_search('*.fits')

openw, f, '/Users/eileengonzales/Dropbox/BDNYC/BDNYC_Research/IDL/Indices/SXD_fitsOut2.txt', width=250, /GET_LUN
printf,f,'filename  ','feh_z    ','index1   ','vo_z ','index2   ','feh_j    ', 'index3  ','ki_j ','index4   ','hcont    ','index5   '
for i=0,n_elements(SXD2_fits)-1 do begin
name_use=SXD2_fits[i]
data = readfits(SXD2_fits[i],h,/silent)
wl = data[*,0]
flux = data[*,1]
err = data[*,2]
feh_z=ALLERS13_INDEX(wl,flux,index1,/feh_z,/SXD)
vo_z=ALLERS13_INDEX(wl,flux,index2,/vo_z,/SXD)
feh_j=ALLERS13_INDEX(wl,flux,index3,/feh_j,/SXD)
ki_j=ALLERS13_INDEX(wl,flux,index4,/ki_j,/SXD)
hcont=ALLERS13_INDEX(wl,flux,index5,/hcont,/SXD)
printf,f,name_use,feh_z,index1,vo_z,index2,feh_j,index3,ki_j,index4,hcont,index5
endfor
free_lun,f


end
