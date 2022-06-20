package models

import "time"

type Pooltechnics struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	PriceAt   float64   `json:"price_at"`
	PriceDe   float64   `json:"price_de"`
	PriceCh   float64   `json:"price_ch"`
	Desc      string    `json:"desc"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Poolsize struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	Length    int32     `json:"length"`
	Width     int32     `json:"width"`
	PriceAt   float64   `json:"price_at"`
	PriceDe   float64   `json:"price_de"`
	PriceCh   float64   `json:"price_ch"`
	Desc      string    `json:"desc"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Pooledge struct {
	ID         int32     `json:"id"`
	PooltypeID int32     `json:"pooltype_id"`
	Name       string    `json:"name"`
	Number     string    `json:"number"`
	PriceAt    float64   `json:"price_at"`
	PriceDe    float64   `json:"price_de"`
	PriceCh    float64   `json:"price_ch"`
	Desc       string    `json:"desc"`
	CreatedAt  time.Time `json:"created_at"`
	UpdatedAt  time.Time `json:"updated_at"`
}

type Poolcolor struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	Value     string    `json:"value"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type PoolformStepsform struct {
	PoolformID  int32     `json:"poolform_id"`
	StepsformID int32     `json:"stepsform_id"`
	Pos         int32     `json:"pos"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}

type PoolformPoolbench struct {
	PoolformID  int32     `json:"poolform_id"`
	PoolbenchID int32     `json:"poolbench_id"`
	Pos         int32     `json:"pos"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}

type Colorvari struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	PriceAt   float64   `json:"price_at"`
	PriceDe   float64   `json:"price_de"`
	PriceCh   float64   `json:"price_ch"`
	Desc      string    `json:"desc"`
	Image     string    `json:"image"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Skimmertype struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	PriceAt   float64   `json:"price_at"`
	PriceDe   float64   `json:"price_de"`
	PriceCh   float64   `json:"price_ch"`
	Desc      string    `json:"desc"`
	Image     string    `json:"image"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Ventil struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	PriceAt   float64   `json:"price_at"`
	PriceDe   float64   `json:"price_de"`
	PriceCh   float64   `json:"price_ch"`
	Desc1     string    `json:"desc1"`
	Image     string    `json:"image"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Poolwater struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	PriceAt   float64   `json:"price_at"`
	PriceDe   float64   `json:"price_de"`
	PriceCh   float64   `json:"price_ch"`
	Desc1     string    `json:"desc1"`
	Desc2     string    `json:"desc2"`
	Desc3     string    `json:"desc3"`
	Desc4     string    `json:"desc4"`
	Desc5     string    `json:"desc5"`
	Image     string    `json:"image"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
	Ventil    []Ventil  `json:"ventil_list"`
}

type Electro struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	PriceAt   float64   `json:"price_at"`
	PriceDe   float64   `json:"price_de"`
	PriceCh   float64   `json:"price_ch"`
	Desc1     string    `json:"desc1"`
	Image     string    `json:"image"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Whirlpool struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	PriceAt   float64   `json:"price_at"`
	PriceDe   float64   `json:"price_de"`
	PriceCh   float64   `json:"price_ch"`
	Desc1     string    `json:"desc1"`
	Image     string    `json:"image"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Led struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	PriceAt   float64   `json:"price_at"`
	PriceDe   float64   `json:"price_de"`
	PriceCh   float64   `json:"price_ch"`
	Desc1     string    `json:"desc1"`
	Image     string    `json:"image"`
	HasRemote int32     `json:"has_remote"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Ledremote struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	PriceAt   float64   `json:"price_at"`
	PriceDe   float64   `json:"price_de"`
	PriceCh   float64   `json:"price_ch"`
	Desc1     string    `json:"desc1"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Technicsboxchanges struct {
	ID        int32     `json:"id"`
	Name      string    `json:"name"`
	Number    string    `json:"number"`
	PriceAt   float64   `json:"price_at"`
	PriceDe   float64   `json:"price_de"`
	PriceCh   float64   `json:"price_ch"`
	Desc1     string    `json:"desc1"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Staff struct {
	ID   int32  `json:"value"`
	Name string `json:"label"`
}
