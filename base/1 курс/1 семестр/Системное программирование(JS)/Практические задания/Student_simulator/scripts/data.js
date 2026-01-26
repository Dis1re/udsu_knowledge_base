var Student = {
    hp: 100,
    food: 100,
    stamina: 100,
    cash: 2000
}

var foodCost = 200;
var roomId = 'trashCan';

var Rooms = {
    trashCan: {
        title: 'Клоповник',
        description: '',
        image: 'applications/trashCan.jpg',
        actions: [
            {
                title: 'выйти в окно',
                id: 'window',
                cost: 10
            },
            {
                title: 'выйти в коридор',
                id: 'hall',
                cost: 10
            },
            {
                title: 'идти спать',
                id: 'goSleep',
                cost: 0
            }
        ]
    },

    goSleep: {
        title: 'Кровать',
        description: 'вы проспали 8 часов',
        image: 'applications/goSleep.jpg',
        actions: [
            {
                title: 'встать с кровати',
                id: 'trashCan',
                cost: -30
            },
        ]
    },

    window: {
        title: 'Окно',
        description: 'Вы падаете с 3 этажа',
        image: 'applications/window.webp',
        actions: [
            {
                title: '...',
                id: 'backrooms',
                cost: 0
            }
        ]
    },

    hall: {
        title: 'Коридор',
        description: '',
        image: 'applications/hall.jpg',
        actions: [
            {
                title: 'войти в клоповник',
                id: 'trashCan',
                cost: 10
            },
            {
                title: 'зайти в туалет',
                id: 'toilet',
                cost: 10
            },
            {
                title: 'идти на кухню',
                id: 'kitchen',
                cost: -40
            },
            {
                title: 'идти к вахте',
                id: 'dutyPost',
                cost: 10
            }
        ]
    },

    toilet: {
        title: 'Туалет',
        description: '',
        image: 'applications/toilet.jpg',
        actions: [
            {
                title: 'выйти в коридор',
                id: 'hall',
                cost: 10
            },
            {
                title: '"калдавать"',
                id: 'doMagic',
                cost: 20
            },
            {
                title: 'взять ',
                id: 'hall',
                cost: 10
            }
        ]
    },

    doMagic: {
        title: 'Толчок',
        description: 'Вы успешно опорожнились',
        image: 'applications/doMagic.jpg',
        actions: [
            {
                title: 'встать с унитаза',
                id: 'toilet',
                cost: 0
            }
        ]
    },

    kitchen: {
        title: 'Кухня',
        description: '',
        image: 'applications/kitchen.jpg',
        actions: [
            {
                title: 'выйти в коридор',
                id: 'hall',
                cost: 10
            }
        ]
    },

    dutyPost: {
        title: 'Вахта',
        description: '',
        image: 'applications/dutyPost.jpg',
        actions: [
            {
                title: 'идти в коридор',
                id: 'hall',
                cost: 10
            },
            {
                title: 'выйти на улицу',
                id: 'outside',
                cost: 10
            }
        ]
    },

    outside: {
        title: 'Улица',
        description: '',
        image: 'applications/outside.jpg',
        actions: [
            {
                title: 'идти к УдГУ',
                id: 'udsu',
                cost: 10
            },
            {
                title: 'пойти к вахте',
                id: 'dutyPost',
                cost: 10
            },
            {
                title: 'зайти в кафе',
                id: 'cafe',
                cost: 10
            }
        ]
    },

    cafe: {
        title: 'Кафе',
        description: '',
        image: 'applications/cafe.jpg',
        actions: [
            {
                title: 'выйти на улицу',
                id: 'outside',
                cost: 10
            },
            {
                title: 'купить шаурму',
                id: 'buyKebab',
                cost: 0
            },
            {
                title: 'купить нормальную еду',
                id: 'buyFood',
                cost: 0
            }
        ]
    },

    buyFoodSuc: {
        title: 'Вы купили шаурму',
        description: 'вы купили еду и можете её съесть',
        image: 'applications/buyFood.jpg',
        actions: [
            {
                title: 'съесть шаурму',
                id: 'cafe',
                cost: -30
            }
        ]
    },

    buyFoodBad: {
        title: 'Вы не смогли купить',
        description: 'Вы не смогли наскрести у себя по карманам подходящую сумму',
        image: 'applications/buyFood.jpg',
        actions: [
            {
                title: 'вернуться обратно',
                id: 'cafe',
                cost: 0
            }
        ]
    },

    udsu: {
        title: 'УДгУ',
        description: '',
        image: 'applications/udsu.jpg',
        actions: [
            {
                title: 'выйти на улицу',
                id: 'outside',
                cost: 10
            }
        ]
    },

    backrooms: {
        title: 'Вы умерли',
        description: 'Удачи...',
        image: 'applications/backrooms.jpg',
        actions: [
            {
                title: 'Перезапустить игру',
                id: 'trashCan',
                cost: 0
            }
        ]
    },
    deathScreen: {
        title: "Вы умерли",
        description: '',
        image: '',
        actions: [
            {
                title: 'Перезапустить игру',
                id: 'trashCan',
                cost: 0
            }
        ]
    }
}