// Ascolta i messaggi dal client FiveM
window.addEventListener('message', function(event) {
    if (event.data.show == true) {
        if (event.data.pages) {
            let pagePromises = [];
            
            // Processa ogni pagina del libro
            $.each(event.data.pages, function(index, page) {
                const pagePromise = new Promise((resolve) => {
                    let imgSrc;
                    if (page.source === 'local') {
                        // Immagini locali dalla cartella img/
                        imgSrc = 'img/' + page.pageName + '.png?v=' + Math.random();
                        resolve(imgSrc);
                    } else if (page.source === 'discord') {
                        // Recupera l'URL dell'immagine da Discord tramite server
                        $.post(`https://${GetParentResourceName()}/getDiscordImage`, JSON.stringify({
                            channelId: event.data.discordChannelId,
                            messageId: page.pageName
                        }), function(response) {
                            resolve(response);
                        }).fail(function() {
                            // Immagine segnaposto trasparente in caso di errore
                            resolve('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==');
                        });
                    } else {
                        // URL web diretti
                        imgSrc = page.pageName;
                        resolve(imgSrc);
                    }
                }).then(imgSrc => {
                    // Aggiunge la pagina al flipbook
                    let pageClass = page.type === 'hard' ? ' class="hard"' : '';
                    let imgStyle = '';
                    
                    // Controlla se è la copertina frontale
                    const isFrontCover = page.pageName.includes('COPERTINA') && !page.pageName.includes('END');
                    // Controlla se è la copertina finale
                    const isBackCover = page.pageName.includes('COPERTINA_END');
                    // Controlla se è una pagina vuota
                    const isEmptyPage = page.pageName.includes('PAGINA_VUOTA') || imgSrc.includes('data:image/png;base64,iVBORw0KGgo');
                    
                    if (isFrontCover) {
                        // Per la copertina frontale, aggiungi come pagina hard singola
                        const pageDiv = `<div class="hard"><img src="${imgSrc}" width=${event.data.size.width} height=${event.data.size.height}${imgStyle}></div>`;
                        $('#contenitore').append(pageDiv);
                        
                        // Aggiungi una pagina vuota a sinistra per l'apertura
                        const emptyPageDiv = `<div class="hard"><img src="img/PAGINA_VUOTA_COPERTINA.png" width=${event.data.size.width} height=${event.data.size.height}></div>`;
                        $('#contenitore').append(emptyPageDiv);
                        
                    } else if (isBackCover) {
                        // Per la copertina finale, aggiungi come pagina hard singola
                        const pageDiv = `<div class="hard"><img src="${imgSrc}" width=${event.data.size.width} height=${event.data.size.height}${imgStyle}></div>`;
                        $('#contenitore').append(pageDiv);
                        
                    } else if (isEmptyPage) {
                        // Controlla se è l'ultima pagina vuota prima della copertina finale
                        const isLastEmptyBeforeBackCover = index === event.data.pages.length - 2 && event.data.pages[index + 1].pageName.includes('COPERTINA_END');
                        
                        // Per le pagine vuote, aggiungi sempre la pagina a sinistra
                        const pageClassHard = isLastEmptyBeforeBackCover ? ' class="hard"' : pageClass;
                        const pageDiv = `<div${pageClassHard}><img src="${imgSrc}" width=${event.data.size.width} height=${event.data.size.height}${imgStyle}></div>`;
                        $('#contenitore').append(pageDiv);
                        
                        // Aggiungi anche la pagina specchiata a destra
                        const mirroredPageDiv = `<div${pageClassHard}><img src="${imgSrc}" width=${event.data.size.width} height=${event.data.size.height} style="transform: scaleX(-1);"></div>`;
                        $('#contenitore').append(mirroredPageDiv);
                    } else {
                        // Per le pagine normali, aggiungi normalmente
                        const pageDiv = `<div${pageClass}><img src="${imgSrc}" width=${event.data.size.width} height=${event.data.size.height}${imgStyle}></div>`;
                        $('#contenitore').append(pageDiv);
                    }
                    
                    // Mostra testo sulla copertina se è la prima pagina hard
                    if (page.type === 'hard' && page.pageName.includes('copertina_annuario')) {
                        $('#testo-copertina').show();
                    }
                });
                
                pagePromises.push(pagePromise);
            });
            
            // Inizializza il flipbook dopo aver caricato tutte le pagine
            Promise.all(pagePromises).then(() => {
                $('#contenitore').turn({
                    gradients: true,
                    autoCenter: true,
                    width: event.data.size.width*2,
                    height: event.data.size.height,
                    page: 1,
                    acceleration: true,
                });
                $('body').css('display', 'block');
            });
        }
    } else if (event.data.show == false) {
        // Nasconde l'interfaccia del libro
        $('body').css('display', 'none');
    }

    // Gestisce la chiusura del libro con il tasto ESC
    $(document).keyup(function(e) {
        if (e.keyCode == 27) {
            $('body').css('display', 'none');
            if ($('#contenitore').turn('is')) {
                $('#contenitore').turn('page', 1);
                $('#contenitore').turn('destroy');
            }
            contenitore.style = "";
            $.post(`https://${GetParentResourceName()}/chiudi`, JSON.stringify({}));
        }
    });
});
