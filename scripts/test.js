/*import {world, system, ItemStack} from "@minecraft/server";
// スクリプトイベントの受信時に実行されるコールバック関数を登録
system.events.scriptEventReceive.subscribe(ev => {
    const {id, sourceBlock} = ev;

    // idに基づいて処理を分岐
    switch (id) {
        case `karo:sell`: {
            // ソースブロックの上2ブロックの座標にあるブロックを取得
            let block = world.getDimension(`overworld`).getBlock({x: sourceBlock.location.x, y: sourceBlock.location.y + 2, z: sourceBlock.location.z});
            let finalyPrice = 0;

            // 1から26までのスロットを順番に処理
            for (let i = 1; i < 27; i++) {
                // スロットのアイテムを取得
                //i番目のアイテムを取得
                let item = block.getComponent(`inventory`).container.getItem(i);
                if (typeof item == 'undefined') continue;

                // アイテムのLore（説明文）を取得
                const price = item.getLore();
                if (typeof price == 'undefined') continue;
                if (typeof price[0] == 'undefined') continue;
                if (price[0] == ``) continue;

                // 販売価格を取得して、アイテムの個数と掛け合わせて合計価格を計算
                if (Number(price[0].split(`:`)[1].replace(`円`, ``)) == null) continue;
                finalyPrice += Number(price[0].split(`:`)[1].replace(`円`, ``)) * item.amount;
            }

            // スロット0が未定義で、合計価格が0の場合
            if (typeof block.getComponent(`inventory`).container.getItem(0) == 'undefined' && finalyPrice == 0) {
                // プレイヤーに対してコマンドを実行してアイテムをクリア
                world.getDimension(`overworld`).runCommandAsync(`clear @p[x=${sourceBlock.location.x},y=${sourceBlock.location.y},z=${sourceBlock.location.z}] karo:sell`);
                // 新しい"karo:sell"のアイテムスタックを作成し、スロット0にセット
                let sellButton = new ItemStack(`karo:sell`);
                block.getComponent(`inventory`).container.setItem(0, sellButton);
            }
            // スロット0が未定義でない場合
            else if (typeof block.getComponent(`inventory`).container.getItem(0) == 'undefined') {
                // プレイヤーに対してコマンドを実行してお金のスコアを増加させる
                world.getDimension(`overworld`).runCommandAsync(`scoreboard players add @p[x=${sourceBlock.location.x},y=${sourceBlock.location.y},z=${sourceBlock.location.z}] money ${finalyPrice}`);
                // プレイヤーに対してメッセージを送信
                world.getDimension(`overworld`).runCommandAsync(`tellraw @p[x=${sourceBlock.location.x},y=${sourceBlock.location.y},z=${sourceBlock.location.z}] {"rawtext":[{"text":"§l§a${finalyPrice}円手に入れた"}]}`);
                // プレイヤーに対してコマンドを実行してアイテムをクリア
                world.getDimension(`overworld`).runCommandAsync(`clear @p[x=${sourceBlock.location.x},y=${sourceBlock.location.y},z=${sourceBlock.location.z}] karo:sell`);

                // スロット1から26までのアイテムを処理
                for (let i = 1; i < 27; i++) {
                    let item = block.getComponent(`inventory`).container.getItem(i);
                    if (typeof item == 'undefined') continue;

                    // アイテムのLore（説明文）を取得
                    const price = item.getLore();
                    if (typeof price[0] == 'undefined') continue;
                    if (price[0] == ``) continue;
                    if (Number(price[0].split(`:`)[1].replace(`円`, ``)) == null) continue;

                    // アイテムをクリア
                    block.getComponent(`inventory`).container.setItem(i);
                }

                // 新しい"karo:sell"のアイテムスタックを作成し、スロット0にセット
                let sellButton = new ItemStack(`karo:sell`);
                block.getComponent(`inventory`).container.setItem(0, sellButton);
            }
            // スロット0のアイテムが"karo:sell"でない場合、かつ合計価格が0の場合
            else if (block.getComponent(`inventory`).container.getItem(0).typeId !== `karo:sell` && finalyPrice == 0) {
                // プレイヤーに対してコマンドを実行してアイテムをクリア
                world.getDimension(`overworld`).runCommandAsync(`clear @p[x=${sourceBlock.location.x},y=${sourceBlock.location.y},z=${sourceBlock.location.z}] karo:sell`);
                // スロット0のアイテムを取得
                const beforeitem = block.getComponent(`inventory`).container.getItem(0);
                // 新しい"karo:sell"のアイテムスタックを作成し、スロット0にセット
                let sellButton = new ItemStack(`karo:sell`);
                block.getComponent(`inventory`).container.setItem(0, sellButton);
                // アイテムをスロットに追加
                block.getComponent(`inventory`).container.addItem(beforeitem);
            }
            // スロット0のアイテムが"karo:sell"でない場合
            else if (block.getComponent(`inventory`).container.getItem(0).typeId !== `karo:sell`) {
                // プレイヤーに対してコマンドを実行してお金のスコアを増加させる
                world.getDimension(`overworld`).runCommandAsync(`scoreboard players add @p[x=${sourceBlock.location.x},y=${sourceBlock.location.y},z=${sourceBlock.location.z}] money ${finalyPrice}`);
                // プレイヤーに対してメッセージを送信
                world.getDimension(`overworld`).runCommandAsync(`tellraw @p[x=${sourceBlock.location.x},y=${sourceBlock.location.y},z=${sourceBlock.location.z}] {"rawtext":[{"text":"§l§a${finalyPrice}円手に入れた"}]}`);
                // プレイヤーに対してコマンドを実行してアイテムをクリア
                world.getDimension(`overworld`).runCommandAsync(`clear @p[x=${sourceBlock.location.x},y=${sourceBlock.location.y},z=${sourceBlock.location.z}] karo:sell`);

                // スロット1から26までのアイテムを処理
                for (let i = 1; i < 27; i++) {
                    let item = block.getComponent(`inventory`).container.getItem(i);
                    if (typeof item == 'undefined') continue;

                    // アイテムのLore（説明文）を取得
                    const price = item.getLore();
                    if (typeof price[0] == 'undefined') continue;
                    if (price[0] == ``) continue;
                    if (Number(price[0].split(`:`)[1].replace(`円`, ``)) == null) continue;

                    // アイテムをクリア
                    block.getComponent(`inventory`).container.setItem(i);
                }

                // スロット0のアイテムを取得
                const beforeitem = block.getComponent(`inventory`).container.getItem(0);
                // 新しい"karo:sell"のアイテムスタックを作成し、スロット0にセット
                let sellButton = new ItemStack(`karo:sell`);
                block.getComponent(`inventory`).container.setItem(0, sellButton);
                // アイテムをスロットに追加
                block.getComponent(`inventory`).container.addItem(beforeitem);
            }
            // スロット0のアイテムが"karo:sell"である場合
            else if (block.getComponent(`inventory`).container.getItem(0).typeId == `karo:sell`) {
                // 新しい"karo:sell"のアイテムスタックを作成
                let sellButton = new ItemStack(`karo:sell`);
                sellButton.setLore([`§l§g合計売却価格:${finalyPrice}円`]);

                // スロット0のアイテムのLoreが新しいアイテムスタックのLoreと一致している場合は処理を中断
                if (block.getComponent(`inventory`).container.getItem(0).getLore().toString() === sellButton.getLore().toString()) break;

                // スロット0に新しいアイテムスタックをセット
                block.getComponent(`inventory`).container.setItem(0, sellButton);
            }
            break;
        }
    }
});*/