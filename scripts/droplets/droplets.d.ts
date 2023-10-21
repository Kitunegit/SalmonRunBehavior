import { Vector3, Entity, Player } from "@minecraft/server";

export class DropletsPattern {
    /**
     * 飛沫のパターンを作成します。
     * @param pattern 飛沫を飛ばす間隔のパターン。
     */
    constructor(pattern: number[]);
    /**
     * 飛沫を飛ばす間隔のパターン。
     */
    pattern: number[];
    /**
     * 現在選択されているパターンのインデックス番号。
     */
    current: number;
    /**
     * 次のパターンを選択し、そのパターンにおける飛沫の間隔の値からDropletsオブジェクトを作成します。
     * @param initialLocation 弾の初期位置。
     * @param maxSpawnCount 飛沫を飛ばすことができる最大の回数。
     */
    rand(initialLocation: Vector3, maxSpawnCount: number): Droplets
}

export class Droplets {
    /**
     * 弾の位置情報などを基に、飛沫を飛ばすためのデータ保存を行います。
     * @param targetDistance 目標となる距離。
     * @param initialLocation 弾の初期位置。
     * @param maxSpawnCount 飛沫を飛ばすことができる最大の回数。
     */
    constructor(targetDistance: number, initialLocation: Vector3, maxSpawnCount: number);
    /**
     * 目標となる距離。
     */
    targetDistance: number;
    /**
     * 飛沫を飛ばした回数。
     */
    spawnCount: number;
    /**
     * 飛沫を飛ばすことができる最大の回数。
     */
    maxSpawnCount: number;
    /**
     * 最後に飛沫を飛ばした座標。
     */
    lastLocation: Vector3;
    /**
     * 飛沫を飛ばす条件を満たしているかどうかを調べ、満たしていれば飛沫を飛ばします。
     * @param entity 弾となるエンティティ。
     */
    fly(entity: Entity): Entity | void;
}

/**
 * プレイヤー毎に現在選択しているパターンを保存するためのデータベースです。
 */
export const dropletsDataBase: Map<Player, DropletsPattern>;
