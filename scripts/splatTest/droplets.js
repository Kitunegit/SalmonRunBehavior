import { world, system, Vector } from "@minecraft/server";

export class DropletsPattern {
    constructor(pattern) {
        this.pattern = pattern;
        this.current = Math.floor(Math.random() * pattern.length);
    }
    rand(initialLocation, maxSpawnCount = 1) {
        if (this.current >= this.pattern.length - 1) this.current = 0;
        else this.current += 1;
        return new Droplets(this.pattern[this.current], initialLocation, maxSpawnCount);
    }
}

export class Droplets {
    constructor(targetDistance, initialLocation, maxSpawnCount) {
        this.targetDistance = targetDistance;
        this.spawnCount = 0;
        this.maxSpawnCount = maxSpawnCount;
        this.lastLocation = initialLocation;
    }
    fly(entity) {
        if (Vector.distance(this.lastLocation, entity.location) > this.targetDistance && (this.spawnCount < this.maxSpawnCount)) {
            const droplets = entity.dimension.spawnEntity("armor_stand", entity.location);
            this.spawnCount++;
            this.lastLocation = entity.location;
            return droplets;
        }
    }
}

export const dropletsDataBase = new Map();

world.getAllPlayers().forEach(player => {
    dropletsDataBase.set(player, new DropletsPattern([5, 10, 15]));
});

world.afterEvents.itemUse.subscribe(({ source, itemStack }) => {
    if (itemStack.typeId !== "minecraft:blaze_rod") return;

    const droplets = dropletsDataBase.get(source).rand(source.location, 3);

    const playerViewDir = source.getViewDirection();
    const projectile = source.dimension.spawnEntity("armor_stand", Vector.add(source.location, playerViewDir));

    projectile.setRotation(source.getRotation());
    projectile.applyImpulse(Vector.multiply(playerViewDir, 5));

    const runId = system.runInterval(() => {
        if (!world.getEntity(projectile.id)) {
            system.clearRun(runId);
            return;
        }
        droplets.fly(projectile);
    });
});
