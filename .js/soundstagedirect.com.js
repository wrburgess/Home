(function() {
    if (typeof bssd_trim == "undefined") {
        function bssd_trim() {
            this.replace(/\s/g, '');
        }
    }

    if (typeof bssd_extract_name == "undefined") {
        function bssd_extract_name() {
            console.log(this);
        }
    }

    $(document).ready(function() {
        var main_table = $('form[name="searchform"]').parent().find('tbody'),
            table = $("h2:contains('Genre')").siblings('table').find('tbody'),
            records = [];

        table.find('tr').each(function(i, row) {
            row = $(row);
            row.find('td').each(function(i, cell) {

                cell = $(cell);

                cell.find('a[name]').next().text()
                var name = cell.find('a[name]').next().text(),
                    artist = cell.find('font').text().trim(),
                    image = cell.find('a[name]').next().find('img').clone();

                console.log(image);

                if (artist !== '' && name !== '') {
                    var record = {
                        artist: artist,
                        name: name,
                        image: image
                    };

                    records.push(record);
                }
            });
        });

        //table.remove();
        //$('#Table_').remove();

        console.log(records);
        console.log(main_table);
        console.log(table);

        table.prepend('<tr><td colspan="2"><ul id="bssd-records"></ul></td></tr>');
        records_container = $('#bssd-records');
        $(records).each(function(i, record) {
            if (record.artist !== '' && record.name !== '') {
                records_container.append([
                    '<li>',
                    record.image,
                    '<span class="artist">' + record.artist + '</span>',
                    ' - ',
                    '<span class="name">' + record.name + '</span>',
                    '</li>'
                ].join(''));
            }
        });

    });
})();