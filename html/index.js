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
                    
                    const pageDiv = `<div${pageClass}><img src="${imgSrc}" width=${event.data.size.width} height=${event.data.size.height}${imgStyle}></div>`;
                    $('#contenitore').append(pageDiv);
                    
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
